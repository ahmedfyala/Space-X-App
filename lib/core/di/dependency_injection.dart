import 'package:flutter_mentorship_b1/features/rockets/logic/all_rockets_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

import '../../features/rockets/data/repo/all_rockets_repo.dart';
import '../networking/api_service.dart';
import '../networking/dio_factory.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // MARK: - Dio & ApiService.
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));
  getIt.registerLazySingleton<AllRocketsRepo>(
      () => AllRocketsRepo(apiService: getIt()));
  getIt.registerLazySingleton<AllRocketsCubit>(() => AllRocketsCubit(
        allRocketsRepo: getIt(),
      ));
}
