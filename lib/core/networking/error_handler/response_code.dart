class ResponseCode {
  static const int ok = 200;
  static const int created = 201;
  static const int accepted = 202;
  static const int noContent = 204;
  static const int partialContent = 206;
  static const int movedPermanently = 301;
  static const int found = 302;
  static const int seeOther = 303;
  static const int notModified = 304;
  static const int badRequest = 400;
  static const int unauthorized = 401;
  static const int forBidden = 403;
  static const int notFound = 404;
  static const int methodNotAllowed = 405;
  static const int notAcceptable = 406;
  static const int conflict = 409;
  static const int payloadToLarge = 413;
  static const int internalServerError = 500;
  static const int badGatWay = 502;
  static const int serverUnavailable = 503;
  static const int gatewayTimeout = 504;
  static const int connectionTimeout = 408;
  static const int sendTimeout = -1;
  static const int receiveTimeout = -2;
  static const int badCertificate = -3;
  static const int noInternetConnection = -4;
  static const int unknown = -5;
}