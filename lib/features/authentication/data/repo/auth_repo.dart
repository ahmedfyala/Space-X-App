import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_mentorship_b1/core/helpers/shared_preferences_helper.dart';

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

  Future<Either<Failure, UserModel>> register(
      {required String email,
      required String password,
      required String name}) async {
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
      SharedPreferencesHelper.setData('uId', signedInUser.uid);
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
      final signedInUser = userCredential.user!;
      UserModel user = UserModel(
        name: signedInUser.displayName ?? '',
        email: signedInUser.email!,
        uId: signedInUser.uid,
      );
      SharedPreferencesHelper.setData('uId', signedInUser.uid);
      SharedPreferencesHelper.setData('Name', signedInUser.displayName ?? '');
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
}
