import 'package:dio/dio.dart';
import 'package:shopping_app/core/errors/failure.dart';

class ServerFailure extends Failure {
  ServerFailure(super.message);

  factory ServerFailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout');
      case DioExceptionType.badCertificate:
        return ServerFailure('Bad certificate');
      case DioExceptionType.badResponse:
        return ServerFailure.fromBadResponse(
          dioException.response!.statusCode,
          dioException.response!.data,
        );
      case DioExceptionType.cancel:
        return ServerFailure('Your response was canceled');
      case DioExceptionType.connectionError:
        return ServerFailure('Connection error, please check your internet');
      case DioExceptionType.unknown:
        return ServerFailure('please check your internet connection!');
      default:
        return ServerFailure('Ops There was an Error, Please try again');
    }
  }

  factory ServerFailure.fromBadResponse(int? statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      //return ServerFailure(response['error']['message']);
      return ServerFailure('Ops There was an Error, Please try again');
    } else if (statusCode == 404) {
      return ServerFailure('Your request not found, Please try later!');
    } else if (statusCode == 500) {
      return ServerFailure('Internal Server error, Please try later');
    } else {
      return ServerFailure('Ops There was an Error, Please try again');
    }
  }
}