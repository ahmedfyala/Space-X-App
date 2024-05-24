import 'package:flutter_mentorship_b1/core/networking/network_info/network_info.dart';
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
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../features/about_company/data/repo/about_company_repo.dart';
import '../../features/profile/logic/profile_cubit.dart';
import '../../features/ships/data/repository/ship_repository.dart';
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
  getIt.registerLazySingleton<ShipCubit>(
    () => ShipCubit(
      getIt(),
    ),
  );

  // get all rockets
  getIt.registerLazySingleton<AllRocketsRepo>(
      () => AllRocketsRepo(apiService: getIt(), networkInfo: getIt()));
  getIt.registerFactory<AllRocketsCubit>(
      () => AllRocketsCubit(allRocketsRepo: getIt()));

  // get all crew
  getIt.registerLazySingleton<CrewRepository>(
      () => CrewRepository(apiService: getIt(), networkInfo: getIt()));
  getIt.registerFactory<CrewCubit>(() => CrewCubit(getIt()));

  // auth
  getIt.registerLazySingleton<AuthRepository>(() => AuthRepository());

  getIt.registerFactory<RegisterCubit>(() => RegisterCubit(getIt()));
  getIt.registerFactory<AuthCubit>(() => AuthCubit(getIt()));

  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));

  // profile
  getIt.registerFactory<ProfileCubit>(() => ProfileCubit());

  // get about company
  getIt.registerLazySingleton<AboutCompanyRepo>(
      () => AboutCompanyRepo(getIt(), getIt()));
  getIt.registerFactory<CompanyCubit>(() => CompanyCubit(getIt()));
}

Future<void> initAuthFeature() async {
  getIt.registerFactory<AuthRepository>(() => AuthRepository());

  getIt.registerFactory<RegisterCubit>(() => RegisterCubit(getIt()));
  getIt.registerFactory<AuthCubit>(() => AuthCubit(getIt()));

  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));
}
