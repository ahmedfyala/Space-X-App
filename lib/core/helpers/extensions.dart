import 'package:flutter/material.dart';

import '../networking/error_handler/failure.dart';
import '../networking/error_handler/response_code.dart';
import '../networking/error_handler/response_massage.dart';
import 'enums.dart';

// MARK: - 🎗 For Make navigation easy.
extension Navigation on BuildContext {
  Future<dynamic> pushNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamed(
      routeName,
      arguments: arguments,
    );
  }

  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushReplacementNamed(
      routeName,
      arguments: arguments,
    );
  }

  Future<dynamic> pushNamedAndRemoveUntil(String routeName,
      {Object? arguments, required RoutePredicate predicate}) {
    return Navigator.of(this).pushNamedAndRemoveUntil(
      routeName,
      predicate,
      arguments: arguments,
    );
  }

  void pop() {
    Navigator.of(this).pop();
  }
}

// MARK: - 🎨 For Converting Hex to Color.
extension HexColor on Color {
  static Color fromHex(
    String hexColorString,
  ) {
    hexColorString = hexColorString.replaceAll('#', '');
    if (hexColorString.length == 6) {
      hexColorString = 'FF$hexColorString';
    }
    return Color(
      int.parse(
        hexColorString,
        radix: 16,
      ),
    );
  }
}

extension HttpStatusCodeExtensions on HttpStatusCodeEnum {
  Failure getFailure() {
    switch (this) {
      case HttpStatusCodeEnum.ok:
        return Failure(
          ResponseCode.ok,
          ResponseMassage.ok,
        );
      case HttpStatusCodeEnum.created:
        return Failure(
          ResponseCode.created,
          ResponseMassage.created,
        );
      case HttpStatusCodeEnum.accepted:
        return Failure(
          ResponseCode.accepted,
          ResponseMassage.accepted,
        );
      case HttpStatusCodeEnum.noContent:
        return Failure(
          ResponseCode.noContent,
          ResponseMassage.noContent,
        );
      case HttpStatusCodeEnum.partialContent:
        return Failure(
          ResponseCode.partialContent,
          ResponseMassage.partialContent,
        );
      case HttpStatusCodeEnum.movedPermanently:
        return Failure(
          ResponseCode.movedPermanently,
          ResponseMassage.movedPermanently,
        );
      case HttpStatusCodeEnum.found:
        return Failure(
          ResponseCode.found,
          ResponseMassage.found,
        );
      case HttpStatusCodeEnum.seeOther:
        return Failure(
          ResponseCode.seeOther,
          ResponseMassage.seeOther,
        );
      case HttpStatusCodeEnum.notModified:
        return Failure(
          ResponseCode.notModified,
          ResponseMassage.notModified,
        );
      case HttpStatusCodeEnum.badRequest:
        return Failure(
          ResponseCode.badRequest,
          ResponseMassage.badRequest,
        );
      case HttpStatusCodeEnum.unauthorized:
        return Failure(
          ResponseCode.unauthorized,
          ResponseMassage.unauthorized,
        );
      case HttpStatusCodeEnum.forBidden:
        return Failure(
          ResponseCode.forBidden,
          ResponseMassage.forBidden,
        );
      case HttpStatusCodeEnum.notFound:
        return Failure(
          ResponseCode.notFound,
          ResponseMassage.notFound,
        );
      case HttpStatusCodeEnum.methodNotAllowed:
        return Failure(
          ResponseCode.methodNotAllowed,
          ResponseMassage.methodNotAllowed,
        );
      case HttpStatusCodeEnum.notAcceptable:
        return Failure(
          ResponseCode.notAcceptable,
          ResponseMassage.notAcceptable,
        );
      case HttpStatusCodeEnum.conflict:
        return Failure(
          ResponseCode.conflict,
          ResponseMassage.conflict,
        );
      case HttpStatusCodeEnum.payloadToLarge:
        return Failure(
          ResponseCode.payloadToLarge,
          ResponseMassage.payloadToLarge,
        );
      case HttpStatusCodeEnum.internalServerError:
        return Failure(
          ResponseCode.internalServerError,
          ResponseMassage.internalServerError,
        );
      case HttpStatusCodeEnum.badGatWay:
        return Failure(
          ResponseCode.badGatWay,
          ResponseMassage.badGatWay,
        );
      case HttpStatusCodeEnum.serverUnavailable:
        return Failure(
          ResponseCode.serverUnavailable,
          ResponseMassage.serverUnavailable,
        );
      case HttpStatusCodeEnum.gatewayTimeout:
        return Failure(
          ResponseCode.gatewayTimeout,
          ResponseMassage.gatewayTimeout,
        );
      case HttpStatusCodeEnum.noInternetConnection:
        return Failure(
          ResponseCode.noInternetConnection,
          ResponseMassage.noInternetConnection,
        );
      case HttpStatusCodeEnum.connectionTimeout:
        return Failure(
          ResponseCode.connectionTimeout,
          ResponseMassage.connectionTimeout,
        );
      case HttpStatusCodeEnum.sendTimeout:
        return Failure(
          ResponseCode.sendTimeout,
          ResponseMassage.sendTimeout,
        );
      case HttpStatusCodeEnum.receiveTimeout:
        return Failure(
          ResponseCode.receiveTimeout,
          ResponseMassage.receiveTimeout,
        );
      case HttpStatusCodeEnum.badCertificate:
        return Failure(
          ResponseCode.badCertificate,
          ResponseMassage.badCertificate,
        );
      case HttpStatusCodeEnum.unknown:
        return Failure(
          ResponseCode.unknown,
          ResponseMassage.unknown,
        );
    }
  }
}
