import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_mentorship_b1/core/helpers/enums.dart';
import 'package:flutter_mentorship_b1/core/helpers/extensions.dart';
import 'package:flutter_mentorship_b1/core/helpers/shared_preferences_helper.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../../../core/networking/error_handler/failure.dart';
import '../models/user_model.dart';

class AuthRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<User?> getCurrentUser() async {
    if (_firebaseAuth.currentUser == null) {
      log("[debug 🐛] Current user is null");
      return null;
    } else {
      if (SharedPreferencesHelper.getData("uId") == null) {
        SharedPreferencesHelper.setData(
          'uId',
          FirebaseAuth.instance.currentUser!.uid,
        );
      }
      log('[debug 🐛] uId is ${_firebaseAuth.currentUser!.uid}');
      return _firebaseAuth.currentUser;
    }
  }

  Future<void> logOut() async {
    SharedPreferencesHelper.clearAllData();
    await _firebaseAuth.signOut();
  }

  Future<Either<Failure, UserModel>> register({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      log('[debug 🐛] Register success');
      final signedInUser = userCredential.user!;
      UserModel user = UserModel(
        name: name,
        email: email,
        uId: signedInUser.uid,
      );

      /// Add User in database
      FirebaseFirestore.instance
          .collection('users')
          .doc(signedInUser.uid)
          .set(user.toMap());
      log('[debug 🐛] User Created success');

      /// Save user data in shared preferences
      SharedPreferencesHelper.setData('uId', signedInUser.uid);
      SharedPreferencesHelper.setData('name', name);
      SharedPreferencesHelper.setData('email', email);
      return Right(user);
    } on FirebaseAuthException catch (e) {
      log("[error ❌] ${e.toString()}");
      if (e.code == 'weak-password') {
        log("[error ❌] The password provided is too weak.");
        return Left(Failure(0, 'The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        log('[error ❌] The account already exists for that email.');
      }
      log("[error ❌] ${e.message!.toString()}");
      return Left(Failure(0, e.message!));
    }
  }

  Future<Either<Failure, UserModel>> login(
      {required String email, required String password}) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      /// Get user data
      final signedInUser = await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user!.uid)
          .get();
      UserModel user = UserModel.fromMap(signedInUser.data()!);

      /// Save user data in shared preferences
      SharedPreferencesHelper.setData('uId', user.uId);
      SharedPreferencesHelper.setData('name', user.name);
      SharedPreferencesHelper.setData('email', user.email);
      log('[debug 🐛] SignIn success $user');
      return Right(user);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        log('[error ❌] No user found for that email.');
        return Left(Failure(0, 'No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        log('[error ❌] Wrong password provided for that user.');
        return Left(Failure(0, 'Wrong password provided for that user.'));
      }
      log('[error ❌] ${e.message!.toString()}');
      return Left(Failure(0, e.message!));
    }
  }

  Future<Either<Failure, UserCredential>> signInWithGoogleAccount() async {
    if (await InternetConnectionChecker().hasConnection) {
      try {
        final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
        log('google user====================');
        final GoogleSignInAuthentication? googleAuth =
            await googleUser?.authentication;
        log('googleAuth====================');
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken,
          idToken: googleAuth?.idToken,
        );
        log('credential====================');
        var response = await _firebaseAuth.signInWithCredential(credential);

        /// Add User in database
        FirebaseFirestore.instance
            .collection('users')
            .doc(response.user!.uid)
            .set(
              UserModel(
                name: response.user!.displayName ?? '',
                email: response.user!.email ?? '',
                uId: response.user!.uid,
              ).toMap(),
            );

        /// Save user data in shared preferences
        SharedPreferencesHelper.setData('uId', response.user!.uid);
        SharedPreferencesHelper.setData(
            'name', response.user!.displayName ?? '');
        SharedPreferencesHelper.setData('email', response.user!.email ?? '');
        return Right(response);
      } on FirebaseAuthException catch (error) {
        return Left(
          Failure(0, error.message!),
        );
      }
    } else {
      return Left(HttpStatusCodeEnum.noInternetConnection.getFailure());
    }
  }
}
