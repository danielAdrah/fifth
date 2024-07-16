import 'package:dio/dio.dart';

import '../errors/error_model.dart';

class ServerExcption implements Exception {
  final ErrorModel errModel;

  ServerExcption({required this.errModel});
}

void handleDioExcption(DioException e) {
  ErrorModel errorModel;
  if (e.response != null) {
    errorModel = ErrorModel.fromJson(e.response!.data);
  } else {
    errorModel = ErrorModel(non_field_errors: ["something wrong"]);
  }
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
      throw ServerExcption(errModel: errorModel);
    case DioExceptionType.sendTimeout:
      throw ServerExcption(errModel: errorModel);
    case DioExceptionType.receiveTimeout:
      throw ServerExcption(errModel: errorModel);
    case DioExceptionType.badCertificate:
      throw ServerExcption(errModel: errorModel);
    case DioExceptionType.cancel:
      throw ServerExcption(errModel: errorModel);
    case DioExceptionType.connectionError:
      throw ServerExcption(errModel: errorModel);
    case DioExceptionType.unknown:
      throw ServerExcption(errModel: errorModel);
    case DioExceptionType.badResponse:
      switch (e.response?.statusCode) {
        case 400: //bad request
          throw ServerExcption(errModel: errorModel);

        case 401: //unauth
          throw ServerExcption(errModel: errorModel);

        case 403: //forbbiden
          throw ServerExcption(errModel: errorModel);

        case 404: //not found
          throw ServerExcption(errModel: errorModel);

        case 409: //coffecient
          throw ServerExcption(errModel: errorModel);

        case 422: //wrong entity
          throw ServerExcption(errModel: errorModel);

        case 504: //server excption
          throw ServerExcption(errModel: errorModel);
      }
  }
}
