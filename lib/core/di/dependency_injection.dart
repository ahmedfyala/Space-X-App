import 'package:flutter_mentorship_b1/core/networking/network_info/network_info.dart';
import 'package:flutter_mentorship_b1/features/authentication/data/repo/auth_repo.dart';
import 'package:flutter_mentorship_b1/features/authentication/logic/auth/auth_cubit.dart';
import 'package:flutter_mentorship_b1/features/authentication/logic/register/register_cubit.dart';
import 'package:flutter_mentorship_b1/features/authentication/logic/login/login_cubit.dart';
import 'package:flutter_mentorship_b1/features/ships/data/repositore/ship_repository.dart';
import 'package:flutter_mentorship_b1/features/ships/logic/cubit.dart';

import 'package:flutter_mentorship_b1/features/rockets/data/repo/all_rockets_repo.dart';
import 'package:flutter_mentorship_b1/features/rockets/logic/all_rockets_cubit.dart';

import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../networking/api_service.dart';
import '../networking/dio_factory.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  Dio dio = DioFactory.getDio();

  InternetConnectionChecker connectionChecker = InternetConnectionChecker();
  // register api service
  getIt.registerLazySingleton<ApiService>(
    () => ApiService(dio),
  );
  getIt.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(connectionChecker),
  );

  // get all ships
  getIt.registerLazySingleton<ShipRepository>(
    () => ShipRepository(
      getIt(),
      getIt(),
    ),
  );
  getIt.registerFactory<ShipCubit>(
    () => ShipCubit(
      getIt(),
    ),
  );

  // get all rockets
  getIt.registerLazySingleton<AllRocketsRepo>(
      () => AllRocketsRepo(apiService: getIt()));
  getIt.registerLazySingleton<AllRocketsCubit>(
      () => AllRocketsCubit(allRocketsRepo: getIt()));

  // auth
  getIt.registerLazySingleton<AuthRepository>(() => AuthRepository());

  getIt.registerLazySingleton<RegisterCubit>(() => RegisterCubit(getIt()));
  getIt.registerLazySingleton<AuthCubit>(() => AuthCubit(getIt()));

  getIt.registerLazySingleton<LoginCubit>(() => LoginCubit(getIt()));
}
