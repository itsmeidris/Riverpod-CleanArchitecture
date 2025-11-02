import 'package:dio/dio.dart';
import 'package:riverpod_clean_architecture/core/config/network/interceptors/logger_interceptor.dart';
import 'package:riverpod_clean_architecture/core/constants/api_endpoints.dart';

class DioClient {
  late final Dio _dio;
  Dio get dio => _dio;

  DioClient() {
    _dio = Dio(
      BaseOptions(
        baseUrl: ApiEndpoints.baseUrL,
        connectTimeout: Duration(seconds: 15),
        receiveTimeout: Duration(seconds: 20),
        headers: {'Content-Type': 'application/json'},
      ),
    );

    //INTERCEPTORS
    _dio.interceptors.addAll([LoggerInterceptor()]);

    //GENERIC GET METHOD
    Future<Response> get(
      String endpoint, {
      Map<String, dynamic>? queryParams,
    }) async {
      try {
        return await _dio.get(endpoint, queryParameters: queryParams);
      } on DioException catch (e) {
        throw Exception(_handleError(e));
      }
    }
  }

  //HANDLING CUSTOM ERRORS
  String _handleError(DioException e) {
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
