import 'package:dartz/dartz.dart';
import 'package:flutter_mentorship_b1/core/helpers/extensions.dart';

import '../../../../core/helpers/enums.dart';
import '../../../../core/networking/api_constants.dart';
import '../../../../core/networking/api_service.dart';
import '../../../../core/networking/error_handler/error_handler.dart';
import '../../../../core/networking/error_handler/failure.dart';
import '../../../../core/networking/network_info/network_info.dart';
import '../models/about_company_model.dart';

class AboutCompanyRepo {
  final ApiService apiService;

  AboutCompanyRepo(
    this.apiService,
  );

  Future<Either<Failure, AboutCompany>> getAboutCompany() async {
    if (NetworkInfo.isConnected) {
      try {
        var response = await apiService.get(endPoint: ApiUrls.company);
        AboutCompany aboutCompany = AboutCompany.fromJson(response);
        return right(aboutCompany);
      } catch (error) {
        return left(ErrorHandler.handel(error).failure);
      }
    } else {
      return left(HttpStatusCodeEnum.noInternetConnection.getFailure());
    }
  }
}
