import 'package:dartz/dartz.dart';
import 'package:flutter_mentorship_b1/core/helpers/extensions.dart';
import 'package:flutter_mentorship_b1/features/crew/data/models/crew_model.dart';

import '../../../../core/helpers/enums.dart';
import '../../../../core/networking/api_constants.dart';
import '../../../../core/networking/api_service.dart';
import '../../../../core/networking/error_handler/error_handler.dart';
import '../../../../core/networking/error_handler/failure.dart';
import '../../../../core/networking/network_info/network_info.dart';

class CrewRepository {
  final ApiService apiService;
  final NetworkInfo networkInfo;

  CrewRepository({required this.apiService, required this.networkInfo});

  Future<Either<Failure, List<CrewMember>>> getCrew() async {
    if (await networkInfo.isConnected) {
      try {
        var response = await apiService.get(endPoint: ApiUrls.allCrew);

        List<CrewMember> crew = [];
        response.forEach((element) {
          crew.add(CrewMember.fromJson(element));
        });
        return right(crew);
      } catch (error) {
        return left(ErrorHandler.handel(error).failure);
      }
    } else {
      return Left(HttpStatusCodeEnum.noInternetConnection.getFailure());
    }
  }
}
