class ResponseMassage {
  static const String ok = 'successful ';
  static const String created =
      'The request has been fulfilled, and a new resource is created ';
  static const String accepted =
      'The request has been accepted for processing, but the processing has not been completed';
  static const String noContent =
      'The request has been successfully processed, but is not returning any content';
  static const String partialContent =
      'The server is delivering only part of the resource due to a range header sent by the client';
  static const String movedPermanently =
      'The requested page has moved to a new URL';
  static const String found =
      'The requested page has moved temporarily to a new URL';
  static const String seeOther =
      'The requested page can be found under a different URL';
  static const String notModified =
      'Indicates the requested page has not been modified since last requested';
  static const String badRequest =
      'The request cannot be fulfilled due to bad syntax';
  static const String unauthorized =
      'The request cannot be fulfilled due to bad syntax';
  static const String forBidden =
      'The request was a legal request, but the server is refusing to respond to it';
  static const String notFound =
      'The requested page could not be found but may be available again in the future';
  static const String methodNotAllowed =
      'A request was made of a page using a request method not supported by that page';
  static const String notAcceptable =
      'The server can only generate a response that is not accepted by the client';
  static const String conflict =
      'The request could not be completed because of a conflict in the request';
  static const String payloadToLarge =
      'The server will not accept the request, because the request entity is too large';
  static const String internalServerError =
      'A generic error message, given when no more specific message is suitable';
  static const String badGatWay =
      'The server was acting as a gateway or proxy and received an invalid response from the upstream server';
  static const String serverUnavailable =
      'The server is currently unavailable (overloaded or down)';
  static const String gatewayTimeout =
      'The server was acting as a gateway or proxy and did not receive a timely response from the upstream server';
  static const String connectionTimeout = 'connectionTimeout , try again later';
  static const String sendTimeout = 'sendTimeout , try again later';
  static const String receiveTimeout = 'receiveTimeout , try again later';
  static const String badCertificate = 'badCertificate , try again later ';
  static const String noInternetConnection = 'no internet connection';
  static const String unknown = 'som error , try again later';
}
