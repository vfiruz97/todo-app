import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';

import 'interceptors/interceptors.dart';
import 'network_info_service.dart';

@module
abstract class NetworkModule {
  @singleton
  DioFactory dioFactory(DotEnv dotenv, NetworkInfoService networkInfo) {
    return DioFactory(dotenv, networkInfo);
  }

  @injectable
  Dio dio(DioFactory dioFactory) => dioFactory.dio;
}

class DioFactory {
  DioFactory(this._dotenv, this._networkInfo) {
    _lastBaseUrl = _dotenv.env['BASE_URL']!;
  }

  final DotEnv _dotenv;
  final NetworkInfoService _networkInfo;

  Dio? _dio;
  late String _lastBaseUrl;

  Dio get dio {
    _dio ??= _createDio(_lastBaseUrl);
    return _dio!;
  }

  void recreateDio(String newBaseUrl) {
    _dio = _createDio(newBaseUrl);
    _lastBaseUrl = newBaseUrl;
  }

  Dio _createDio(String baseUrl) {
    final dio = Dio();

    dio.options.baseUrl = baseUrl;
    dio.options.connectTimeout = const Duration(milliseconds: 30000);
    dio.options.receiveTimeout = const Duration(milliseconds: 30000);
    dio.options.sendTimeout = const Duration(milliseconds: 30000);
    dio.options.headers['Content-Type'] = 'application/x-protobuf';
    dio.options.responseType = ResponseType.bytes;

    dio.interceptors.add(ConnectivityInterceptor(_networkInfo));
    dio.interceptors.add(
      RetryInterceptor(dio: dio, retries: int.parse(_dotenv.env['RETRY_ATTEMPTS'] ?? '3'), logPrint: print),
    );
    dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true, logPrint: print));

    return dio;
  }
}
