import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class LoggerInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (kDebugMode) {
      debugPrint("REQUEST: ${options.method} ${options.uri}");
      debugPrint("HEADERS: ${options.headers}");
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (kDebugMode) {
      debugPrint(
        "✅RESPONSE: ${response.statusCode} ${response.requestOptions.uri}",
      );
      debugPrint("DATA: ${response.data}");
    }
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    debugPrint("❌ERROR: ${err.requestOptions.uri},${err.message}");
    super.onError(err, handler);
  }
}
