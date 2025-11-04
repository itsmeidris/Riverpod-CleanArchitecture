import 'package:dio/dio.dart';

class DioExceptions {
    //HANDLING CUSTOM ERRORS
  String handleError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return "Connection timeout";
      case DioExceptionType.receiveTimeout:
        return "Recieve timeout";
      case DioExceptionType.sendTimeout:
        return "Sending timeout";
      case DioExceptionType.badResponse:
        return "Server error: ${e.response?.statusCode}";
      case DioExceptionType.connectionError:
        return "Connection error";
      case DioExceptionType.badCertificate:
        return "Bad certification";
      case DioExceptionType.cancel:
        return "Request cancelled";
      default:
        return "Unexpected error: ${e.message}";
    }
  }
}