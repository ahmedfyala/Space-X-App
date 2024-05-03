import 'package:dartz/dartz.dart';
import 'package:flutter_mentorship_b1/core/helpers/extensions.dart';
import 'package:flutter_mentorship_b1/core/networking/api_constants.dart';
import 'package:flutter_mentorship_b1/core/networking/error_handler/error_handler.dart';
import 'package:flutter_mentorship_b1/features/rockets/data/modes/rocket_model.dart';

import '../../../../core/helpers/enums.dart';
import '../../../../core/networking/error_handler/failure.dart';
import '../../../../core/networking/network_info/network_info.dart';
import '../../../../core/networking/api_service.dart';

class AllRocketsRepo {
  final ApiService apiService;
  final NetworkInfo networkInfo;

  AllRocketsRepo({required this.apiService, required this.networkInfo});

  Future<Either<Failure, List<RocketModel>>> fetchAllRockets() async {
    if (await networkInfo.isConnected) {
      try {
        var response = await apiService.get(endPoint: ApiUrls.allRockets);

        List<RocketModel> rockets = [];
        response.forEach((element) {
          rockets.add(RocketModel.fromJson(element));
        });
        return right(rockets);
      } catch (error) {
        return left(ErrorHandler.handel(error).failure);
      }
    } else {
      return Left(HttpStatusCodeEnum.noInternetConnection.getFailure());
    }
  }
}
