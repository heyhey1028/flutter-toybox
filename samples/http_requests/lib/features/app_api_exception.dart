class AppApiException implements Exception {
  AppApiException.noInternet()
      : code = AppApiErrorCode.noInternet,
        message = 'No Internet Connection';

  AppApiException.badRequest()
      : code = AppApiErrorCode.badRequest,
        message = '400 Bad Request';

  AppApiException.unAuthorized()
      : code = AppApiErrorCode.unAuthorized,
        message = '401 Unauthorized';

  AppApiException.forbidden()
      : code = AppApiErrorCode.forbidden,
        message = '403 Forbidden';

  AppApiException.notFound()
      : code = AppApiErrorCode.notFound,
        message = '404 Not Found';

  AppApiException.internalServerError()
      : code = AppApiErrorCode.internalServerError,
        message = '500 Internal Server Error';

  AppApiException.unknown()
      : code = AppApiErrorCode.unkown,
        message = 'Unkown Error';

  final AppApiErrorCode code;
  final String message;
}

enum AppApiErrorCode {
  noInternet,
  badRequest,
  unAuthorized,
  forbidden,
  notFound,
  internalServerError,
  unkown;
}
