import 'package:dio/dio.dart';
import 'package:riverpod_clean_architecture/core/config/errors/dio_exceptions.dart';
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
  }
  //GENERIC GET METHOD
  Future<Response> get(
    String endpoint, {
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      return await _dio.get(endpoint, queryParameters: queryParams);
    } on DioException catch (e) {
      throw Exception(DioExceptions().handleError(e));
    }
  }
}
