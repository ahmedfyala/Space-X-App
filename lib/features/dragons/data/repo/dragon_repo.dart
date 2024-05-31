import 'package:dartz/dartz.dart';
import 'package:flutter_mentorship_b1/core/helpers/extensions.dart';
import 'package:flutter_mentorship_b1/core/networking/api_constants.dart';
import 'package:flutter_mentorship_b1/core/networking/error_handler/error_handler.dart';
import 'package:flutter_mentorship_b1/core/networking/error_handler/failure.dart';
import 'package:flutter_mentorship_b1/core/networking/network_info/network_info.dart';
import 'package:flutter_mentorship_b1/core/networking/api_service.dart';
import 'package:flutter_mentorship_b1/features/dragons/data/models/dragon_model.dart';
import '../../../../core/helpers/enums.dart';

class DragonsRepo {
  final ApiService apiService;

  DragonsRepo({required this.apiService,});

  Future<Either<Failure, List<Dragon>>> fetchAllDragons() async {
    if (NetworkInfo.isConnected) {
      try {
        var response = await apiService.get(endPoint: ApiUrls.dragons);

        List<Dragon> dragons = [];
        response.forEach((element) {
          dragons.add(Dragon.fromJson(element));
        });
        return right(dragons);
      } catch (error) {
        return left(ErrorHandler.handel(error).failure);
      }
    } else {
      return Left(HttpStatusCodeEnum.noInternetConnection.getFailure());
    }
  }
}
