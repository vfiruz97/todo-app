import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';

import 'interceptors/interceptors.dart';
import 'network_info_service.dart';

@module
abstract class NetworkModule {
  @injectable
  Dio dio(DotEnv dotenv, NetworkInfoService networkInfo) {
    final dio = Dio();

    // Base configuration
    dio.options.baseUrl = dotenv.env['BASE_URL'] ?? 'http://localhost:8080/';
    dio.options.connectTimeout = const Duration(milliseconds: 30000);
    dio.options.receiveTimeout = const Duration(milliseconds: 30000);
    dio.options.headers['Content-Type'] = 'application/x-protobuf';
    dio.options.responseType = ResponseType.bytes;

    // interceptors
    dio.interceptors.add(ConnectivityInterceptor(networkInfo));
    dio.interceptors.add(
      RetryInterceptor(dio: dio, retries: int.parse(dotenv.env['RETRY_ATTEMPTS'] ?? '3'), logPrint: print),
    );

    dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true, logPrint: print));

    return dio;
  }
}
