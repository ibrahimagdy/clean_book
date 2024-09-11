import 'package:dio/dio.dart';

abstract class Failures {
  final String errMessage;

  const Failures(this.errMessage);
}

class ServiceFailure extends Failures {
  ServiceFailure(super.errMessage);

  factory ServiceFailure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServiceFailure('Connection timeout with ApiServer');
      case DioExceptionType.sendTimeout:
        return ServiceFailure('Send timeout with ApiServer');
      case DioExceptionType.receiveTimeout:
        return ServiceFailure('Receive timeout with ApiServer');
      case DioExceptionType.badCertificate:
        return ServiceFailure('Invalid certificate. Please check your network security settings.');
      case DioExceptionType.badResponse:
        return ServiceFailure.fromResponse(
          dioError.response?.statusCode,
          dioError.response?.data,
        );
      case DioExceptionType.cancel:
        return ServiceFailure('Request to ApiServer was canceled');
      case DioExceptionType.connectionError:
        if (dioError.message?.contains('SocketException') ?? false) {
          return ServiceFailure('No Internet Connection');
        }
        return ServiceFailure('No Internet Connection');
      case DioExceptionType.unknown:
        return ServiceFailure('Unexpected Error, Please try again!');
      default:
        return ServiceFailure('Oops! There was an error, please try again.');
    }
  }

  factory ServiceFailure.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServiceFailure(response['error']['message'] ?? 'Unauthorized request');
    } else if (statusCode == 404) {
      return ServiceFailure('Your request was not found, please try later!');
    } else if (statusCode == 500) {
      return ServiceFailure('Internal Server error, please try later');
    } else {
      return ServiceFailure('Oops! There was an error, please try again.');
    }
  }
}