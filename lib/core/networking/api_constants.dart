class ApiUrls {
  static const String baseUrl = "https://api.spacexdata.com/v4/";

  static const String allRockets = "rockets";
  static const String allShips = "ships";
  static const String allCrew = "crew";
  static const String company = "company";
  static const String dragons = "dragons";
  static const String launches = "launches";
}

class ApiErrors {
  static const String badRequest = "Bad Request Error";
  static const String noContent = "No Content Error";
  static const String forbidden = "Forbidden Error";
  static const String unauthorized = "Unauthorized Error";
  static const String notFound = "Not Found Error";
  static const String conflict = "Conflict Error";
  static const String internalServerError = "Internal Server Error";
  static const String defaultError = "Unknown Error";
  static const String sendTimeout = "Send Timeout Error";
  static const String receiveTimeout = "Receive Timeout Error";
  static const String cacheError = "Cache Error";
  static const String retryAgain = "Retry Again Message";
  static const String success = "Success";
  static const String cancel = "Cancel";
  static const String connectionTimeout = "Connection Timeout Error";
  static const String noInternetConnection = "No Internet Connection Error";
}
