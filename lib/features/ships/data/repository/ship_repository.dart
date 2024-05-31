import 'package:dartz/dartz.dart';
import 'package:flutter_mentorship_b1/core/helpers/enums.dart';
import 'package:flutter_mentorship_b1/core/helpers/extensions.dart';
import 'package:flutter_mentorship_b1/core/networking/api_service.dart';
import 'package:flutter_mentorship_b1/core/networking/error_handler/error_handler.dart';

import '../../../../core/networking/api_constants.dart';
import '../../../../core/networking/error_handler/failure.dart';
import '../../../../core/networking/network_info/network_info.dart';
import '../models/ship_model.dart';

class ShipRepository {
  final ApiService apiService;

  ShipRepository(this.apiService,);

  Future<Either<Failure, List<ShipModel>>> getAllShips() async {
    if (NetworkInfo.isConnected) {
      try {
        final response =
            await apiService.get(endPoint: ApiUrls.allShips) as List;
        List<ShipModel> ships = [];

        ships = response.map((e) => ShipModel.fromJson(e)).toList();

        return Right(ships);
      } catch (error) {
        return Left(ErrorHandler.handel(error).failure);
      }
    } else {
      return Left(HttpStatusCodeEnum.noInternetConnection.getFailure());
    }
  }
}
