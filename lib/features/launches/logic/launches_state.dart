part of 'launches_cubit.dart';

sealed class LaunchesState {}

final class LaunchesInitial extends LaunchesState {}

final class LaunchesLoading extends LaunchesState {}

final class LaunchesLoaded extends LaunchesState {
  final List<Launch> launches;

  LaunchesLoaded(this.launches);
}

final class LaunchesError extends LaunchesState {
  final String error;

  LaunchesError(this.error);
}
