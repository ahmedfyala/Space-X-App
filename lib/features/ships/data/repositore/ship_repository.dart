import 'package:dartz/dartz.dart';
import 'package:flutter_mentorship_b1/core/helpers/enums.dart';
import 'package:flutter_mentorship_b1/core/helpers/extensions.dart';
import 'package:flutter_mentorship_b1/core/networking/api_service.dart';
import 'package:flutter_mentorship_b1/core/networking/error_handler/error_handler.dart';
import 'package:flutter_mentorship_b1/core/networking/error_handler/response_massage.dart';

import '../../../../core/networking/api_constants.dart';
import '../../../../core/networking/error_handler/failure.dart';
import '../../../../core/networking/network_info/network_info.dart';
import '../models/ship_model.dart';

class ShipRepository {
  final ApiService apiService;
  final NetworkInfo networkInfo;

  ShipRepository(this.apiService, this.networkInfo);

  Future<Either<Failure, List<ShipModel>>> getAllShips() async {
    if (await networkInfo.isConnected) {
      try {
        final response = await apiService.get(endPoint: ApiUrls.allShips) as List;
        List<ShipModel> ships = [];
print('!!!!!!!!!!!!!');
        ships = response.map((e) => ShipModel.fromJson(e)).toList();
        print('@@@@@@@@@@@@@@');
        return Right(ships);
      } catch (error) {
        print('%%%%%%%%%%%%%');
        return Left(ErrorHandler.handel(error).failure);
      }
    } else {
      return Left(HttpStatusCodeEnum.noInternetConnection.getFailure());
    }
  }
}
