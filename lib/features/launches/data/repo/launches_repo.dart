import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_mentorship_b1/core/helpers/extensions.dart';

import '../../../../core/helpers/enums.dart';
import '../../../../core/networking/api_constants.dart';
import '../../../../core/networking/api_service.dart';
import '../../../../core/networking/error_handler/error_handler.dart';
import '../../../../core/networking/error_handler/failure.dart';
import '../../../../core/networking/network_info/network_info.dart';
import '../models/launches_model.dart';

class LaunchesRepo {
  final ApiService apiService;
  LaunchesRepo({required this.apiService});

  Future<Either<Failure, List<Launch>>> getLaunches() async {
    if (await NetworkInfo.isConnected) {
      try {
        final response =
            await apiService.get(endPoint: ApiUrls.launches) as List;
        List<Launch> launches = [];
        launches = response.map((e) => Launch.fromJson(e)).toList();
        return Right(launches);
      } catch (error) {
        debugPrint(error.toString());
        return Left(ErrorHandler.handel(error).failure);
      }
    } else {
      return Left(HttpStatusCodeEnum.noInternetConnection.getFailure());
    }
  }
}
