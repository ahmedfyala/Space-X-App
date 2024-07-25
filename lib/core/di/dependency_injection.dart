import 'package:flutter_mentorship_b1/features/about_company/logic/company_cubit.dart';
import 'package:flutter_mentorship_b1/features/authentication/data/repo/auth_repo.dart';
import 'package:flutter_mentorship_b1/features/authentication/logic/auth/auth_cubit.dart';
import 'package:flutter_mentorship_b1/features/authentication/logic/register/register_cubit.dart';
import 'package:flutter_mentorship_b1/features/authentication/logic/login/login_cubit.dart';
import 'package:flutter_mentorship_b1/features/crew/data/repo/crew_repo.dart';
import 'package:flutter_mentorship_b1/features/crew/logic/crew_cubit.dart';
import 'package:flutter_mentorship_b1/features/ships/logic/cubit.dart';

import 'package:flutter_mentorship_b1/features/rockets/data/repo/all_rockets_repo.dart';
import 'package:flutter_mentorship_b1/features/rockets/logic/all_rockets_cubit.dart';

import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

import '../../features/about_company/data/repo/about_company_repo.dart';
import '../../features/dragons/data/repo/dragon_repo.dart';
import '../../features/dragons/logic/dragon_cubit.dart';
import '../../features/launches/data/repo/launches_repo.dart';
import '../../features/launches/logic/launches_cubit.dart';
import '../../features/profile/logic/profile_cubit.dart';
import '../../features/ships/data/repository/ship_repository.dart';
import '../networking/api_service.dart';
import '../networking/dio_factory.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  Dio dio = DioFactory.getDio();

  // register api service
  getIt.registerLazySingleton<ApiService>(
    () => ApiService(dio),
  );

  // get all ships
  getIt.registerLazySingleton<ShipRepository>(
    () => ShipRepository(
      getIt(),
    ),
  );
  getIt.registerLazySingleton<ShipCubit>(
    () => ShipCubit(
      getIt(),
    ),
  );

  // get all rockets
  getIt.registerLazySingleton<AllRocketsRepo>(
      () => AllRocketsRepo(apiService: getIt()));
  getIt.registerFactory<AllRocketsCubit>(
      () => AllRocketsCubit(allRocketsRepo: getIt()));

  // get all crew
  getIt.registerLazySingleton<CrewRepository>(
      () => CrewRepository(apiService: getIt()));
  getIt.registerFactory<CrewCubit>(() => CrewCubit(getIt()));

  // auth
  getIt.registerLazySingleton<AuthRepository>(() => AuthRepository());

  getIt.registerFactory<RegisterCubit>(() => RegisterCubit(getIt()));
  getIt.registerFactory<AuthCubit>(() => AuthCubit(getIt()));

  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));

  // profile
  getIt.registerFactory<ProfileCubit>(() => ProfileCubit());

  // get about company
  getIt
      .registerLazySingleton<AboutCompanyRepo>(() => AboutCompanyRepo(getIt()));
  getIt.registerFactory<CompanyCubit>(() => CompanyCubit(getIt()));

  // get all dragons
  getIt.registerLazySingleton<DragonsRepo>(
      () => DragonsRepo(apiService: getIt()));
  getIt.registerFactory<DragonCubit>(() => DragonCubit(getIt()));

  // launches
  getIt.registerLazySingleton<LaunchesRepo>(
          () => LaunchesRepo(apiService: getIt()));
  getIt.registerFactory<LaunchesCubit>(() => LaunchesCubit(getIt()));
}

Future<void> initAuthFeature() async {
  getIt.registerFactory<AuthRepository>(() => AuthRepository());

  getIt.registerFactory<RegisterCubit>(() => RegisterCubit(getIt()));
  getIt.registerFactory<AuthCubit>(() => AuthCubit(getIt()));

  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));
}
