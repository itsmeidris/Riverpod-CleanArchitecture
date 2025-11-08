import 'package:dio/dio.dart';

class DioExceptions {
  String handleError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return 'Connection timeout';
      case DioExceptionType.sendTimeout:
        return 'Send timeout';
      case DioExceptionType.receiveTimeout:
        return 'Receive timeout';
      case DioExceptionType.badResponse:
        final code = e.response?.statusCode;
        final msg = e.response?.data?['message'] ?? 'Unknown';
        return 'Server error $code: $msg';
      case DioExceptionType.connectionError:
        return 'No internet connection';
      case DioExceptionType.badCertificate:
        return 'SSL certificate error';
      case DioExceptionType.cancel:
        return 'Request cancelled';
      default:
        return 'Unexpected error: ${e.message}';
    }
  }
}
