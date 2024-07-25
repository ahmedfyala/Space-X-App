part of 'dragon_cubit.dart';

sealed class DragonState {}

final class DragonInitial extends DragonState {}

final class DragonLoading extends DragonState {}

final class DragonLoaded extends DragonState {
  final List<Dragon> dragons;
  DragonLoaded({required this.dragons});
}

final class DragonError extends DragonState {
  final String error;

  DragonError({required this.error});
}
