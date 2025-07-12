import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class DioClient {
  static const Duration _timeout = Duration(seconds: 30);
  
  static Dio createDio({
    String? baseUrl,
    Duration? timeout,
    Logger? logger,
  }) {
    final dio = Dio(
      BaseOptions(
        baseUrl: baseUrl ?? '',
        connectTimeout: timeout ?? _timeout,
        receiveTimeout: timeout ?? _timeout,
        sendTimeout: timeout ?? _timeout,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    if (logger != null) {
      dio.interceptors.add(
        LogInterceptor(
          logPrint: (object) => logger.d(object.toString()),
          requestBody: true,
          responseBody: true,
          requestHeader: true,
          responseHeader: false,
        ),
      );
    }

    return dio;
  }
}