part of 'all_rockets_cubit.dart';

@immutable
sealed class AllRocketsState {}

final class AllRocketsInitial extends AllRocketsState {}

final class GetAllRocketsLoading extends AllRocketsState {}

final class GetAllRocketsSuccess extends AllRocketsState {
  final List<RocketModel> rockets;

  GetAllRocketsSuccess(this.rockets);
}

final class GetAllRocketsError extends AllRocketsState {
  final String error;

  GetAllRocketsError(this.error);
}
