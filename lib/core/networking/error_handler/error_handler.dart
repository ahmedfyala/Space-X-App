import 'package:dio/dio.dart';
import 'package:flutter_mentorship_b1/core/helpers/extensions.dart';

import '../../helpers/enums.dart';
import 'failure.dart';

class ErrorHandler implements Exception {
  late Failure failure;
  ErrorHandler.handel(dynamic error) {
    if (error is DioException) {
      failure = _handelError(error);
    } else {
      failure = HttpStatusCodeEnum.unknown.getFailure();
    }
  }
}

Failure _handelError(DioException exception) {
  switch (exception.type) {
    case DioExceptionType.connectionTimeout:
      return HttpStatusCodeEnum.connectionTimeout.getFailure();
    case DioExceptionType.sendTimeout:
      return HttpStatusCodeEnum.sendTimeout.getFailure();
    case DioExceptionType.receiveTimeout:
      return HttpStatusCodeEnum.receiveTimeout.getFailure();
    case DioExceptionType.badCertificate:
      return HttpStatusCodeEnum.badCertificate.getFailure();
    case DioExceptionType.badResponse:
      if (exception.response != null &&
          exception.response?.statusCode != null &&
          exception.response?.statusMessage != null) {
        return Failure(exception.response?.statusCode ?? 0,
            exception.response?.statusMessage ?? '');
      } else {
        return HttpStatusCodeEnum.unknown.getFailure();
      }
    case DioExceptionType.cancel:
      return HttpStatusCodeEnum.conflict.getFailure();
    case DioExceptionType.connectionError:
      return HttpStatusCodeEnum.noContent.getFailure();
    case DioExceptionType.unknown:
      return HttpStatusCodeEnum.unknown.getFailure();
  }
}