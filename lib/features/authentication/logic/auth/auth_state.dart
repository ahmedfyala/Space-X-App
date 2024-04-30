part of 'auth_cubit.dart';

sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class UserAuthenticated extends AuthState {}

final class UserUnAuthenticated extends AuthState {}
