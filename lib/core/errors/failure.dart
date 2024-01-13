import 'package:dio/dio.dart';

abstract class Failure {
  final String message;

  Failure(this.message);
}

class ServiceFailure extends Failure {
  ServiceFailure(super.message);
  // ignore: deprecated_member_use
  factory ServiceFailure.fromDioError(DioError e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServiceFailure('connectiom timeout');

      case DioExceptionType.sendTimeout:
        return ServiceFailure('send timeout');
      case DioExceptionType.receiveTimeout:
        return ServiceFailure('receive timeout');
      case DioExceptionType.badCertificate:
        return ServiceFailure('bad Certificate');
      case DioExceptionType.badResponse:
        return ServiceFailure.fromResponseError(
            e.response!.statusCode!, e.response!.data);
      case DioExceptionType.cancel:
        return ServiceFailure('cance ');
      case DioExceptionType.connectionError:
        return ServiceFailure('connectiom error');
      case DioExceptionType.unknown:
        return ServiceFailure('unknown error');
    }
  }
  factory ServiceFailure.fromResponseError(int statuscode, dynamic response) {
    if (statuscode == 404) {
      return ServiceFailure('your request was not found , please try again');
    } else if (statuscode == 500) {
      return ServiceFailure('there is problem with sever, please try again');
    } else if (statuscode == 400 || statuscode == 401 || statuscode == 403) {
      return ServiceFailure(response['error']['message']);
    } else {
      return ServiceFailure('nu known error ');
    }
  }
}
