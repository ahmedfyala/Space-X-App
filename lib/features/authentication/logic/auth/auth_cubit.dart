import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mentorship_b1/features/authentication/data/repo/auth_repo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _authRepo;

  AuthCubit(this._authRepo) : super(AuthInitial());

  getUser() {
    _authRepo.getCurrentUser().then((value) {
      if (value != null) {
        log('[Debug 🐛] User Authenticated');
        emit(UserAuthenticated());
      } else {
        log('[Debug 🐛] User UnAuthenticated');
        emit(UserUnAuthenticated());
      }
    });
  }

  logOut() {
    _authRepo.logOut();
    emit(UserUnAuthenticated());
  }

  Future<void> signInWithGoogleAccount() async {
    emit(GoogleSignInLoading());
    var response = await _authRepo.signInWithGoogleAccount();

    response.fold((failure) {
      emit(
        GoogleSignInFailure(failure.message),
      );
    }, (success) {
      emit(GoogleSignInSuccess());
    });
  }
}
