part of 'profile_cubit.dart';

sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class ProfileLoading extends ProfileState {}

final class ProfileSuccess extends ProfileState {
  ProfileSuccess();
}

final class ProfileError extends ProfileState {
  final String error;

  ProfileError(this.error);
}
