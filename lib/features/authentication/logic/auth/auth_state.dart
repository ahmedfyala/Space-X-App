part of 'auth_cubit.dart';

sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class UserAuthenticated extends AuthState {}

final class UserUnAuthenticated extends AuthState {}

final class GoogleSignInLoading extends AuthState {}

final class GoogleSignInSuccess extends AuthState {}

final class GoogleSignInFailure extends AuthState {
  final String error;
  GoogleSignInFailure(this.error);
}
