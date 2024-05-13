part of 'crew_cubit.dart';

sealed class CrewState {}

final class CrewInitial extends CrewState {}

final class CrewLoading extends CrewState {}

final class CrewLoaded extends CrewState {
  final List<CrewMember> crew;

  CrewLoaded({required this.crew});
}

final class CrewError extends CrewState {
  final String error;

  CrewError({required this.error});
}
