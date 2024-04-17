import 'package:dartz/dartz.dart';
import 'package:flutter_mentorship_b1/core/networking/api_constants.dart';
import 'package:flutter_mentorship_b1/core/networking/error_handler/error_handler.dart';
import 'package:flutter_mentorship_b1/features/rockets/data/modes/rocket_model.dart';

import '../../../../core/networking/api_service.dart';

class AllRocketsRepo {
  final ApiService apiService;

  AllRocketsRepo({required this.apiService});

  Future<Either<ErrorHandler, List<RocketModel>>> fetchAllRockets() async {
    try {
      var response = await apiService.get(endPoint: ApiUrls.allRockets);

      List<RocketModel> rockets = [];
      response.forEach((element) {
        rockets.add(RocketModel.fromJson(element));
      });
      return right(rockets);
    } catch (error) {
      return left(ErrorHandler.handel(error));
    }
  }
}
