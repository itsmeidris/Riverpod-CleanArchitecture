import 'dart:async';
import 'package:dio/dio.dart';

class RetryInterceptor extends Interceptor {
  final Dio dio;
  final int retries;
  final Duration retryDelay;

  RetryInterceptor({
    required this.dio,
    this.retries = 3,
    this.retryDelay = const Duration(seconds: 2),
  });

  @override
  Future onError(DioException err, ErrorInterceptorHandler handler) async {
    // Retry only for certain network-related errors
    if (_shouldRetry(err)) {
      for (var attempt = 1; attempt <= retries; attempt++) {
        try {
          await Future.delayed(retryDelay);
          final options = err.requestOptions;
          final response = await dio.fetch(options);
          return handler.resolve(response);
        } catch (e) {
          if (attempt == retries) {
            // If all retries fail, forward the error
            return handler.next(err);
          }
        }
      }
    }

    // Otherwise, forward the error as is
    return handler.next(err);
  }

  bool _shouldRetry(DioException err) {
    // Retry only on network errors or timeouts
    return err.type == DioExceptionType.connectionTimeout ||
        err.type == DioExceptionType.sendTimeout ||
        err.type == DioExceptionType.receiveTimeout ||
        err.type == DioExceptionType.connectionError;
  }
}
