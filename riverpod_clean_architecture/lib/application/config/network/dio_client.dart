import 'package:dio/dio.dart';
import 'package:riverpod_clean_architecture/application/config/network/errors/dio_exceptions.dart';
import 'package:riverpod_clean_architecture/application/config/network/interceptors/auth_interceptor.dart';
import 'package:riverpod_clean_architecture/application/config/network/interceptors/logger_interceptor.dart';
import 'package:riverpod_clean_architecture/application/config/network/interceptors/retry_interceptor.dart';
import 'package:riverpod_clean_architecture/application/core/constants/api_endpoints.dart';

class DioClient {
  late final Dio _dio;
  Dio get dio => _dio;

  static final DioClient _instance = DioClient._internal();
  factory DioClient() => _instance;

  DioClient._internal() {
    _dio = Dio(
      BaseOptions(
        baseUrl: ApiEndpoints.baseUrL,
        connectTimeout: Duration(seconds: 15),
        receiveTimeout: Duration(seconds: 20),
        responseType: ResponseType.json,
        validateStatus: (status) => status != null && status < 500,
        headers: {'Content-Type': 'application/json'},
      ),
    );

    //INTERCEPTORS
    _dio.interceptors.addAll([
      LoggerInterceptor(), //LOG INTERCEPTOR
      AuthInterceptor(), //AUTH INTERCEPTOR
      RetryInterceptor(dio: dio), //RETRY INTERCEPTOR
    ]);
  }

  //GENERIC GET METHOD
  Future<Response<T>> get<T>(
    String endpoint, {
    Map<String, dynamic>? queryParams,
  }) => request<T>('GET', endpoint, queryParams: queryParams);

  //GENERIC POST METHOD
  Future<Response<T>> post<T>(String endpoint, {dynamic data}) =>
      request<T>('POST', endpoint, data: data);

  //GENERIC REQUEST WRAPPER FOR DRY CODE
  Future<Response<T>> request<T>(
    String method,
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      return await _dio.request<T>(
        endpoint,
        data: data,
        queryParameters: queryParams,
        options: Options(method: method),
      );
    } on DioException catch (e) {
      throw Exception(DioExceptions().handleError(e));
    }
  }
}
