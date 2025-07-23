import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';

import '../../application/services/settings_service.dart';
import 'interceptors/interceptors.dart';
import 'network_info_service.dart';

@module
abstract class NetworkModule {
  @singleton
  DioFactory dioFactory(DotEnv dotenv, NetworkInfoService networkInfo, SettingsService settingsService) {
    return DioFactory(dotenv, networkInfo, settingsService);
  }

  @injectable
  Dio dio(DioFactory dioFactory) => dioFactory.dio;
}

class DioFactory {
  DioFactory(this._dotenv, this._networkInfo, this._settingsService);

  final DotEnv _dotenv;
  final NetworkInfoService _networkInfo;
  final SettingsService _settingsService;

  Dio? _dio;
  String? _lastBaseUrl;

  Dio get dio {
    final currentBaseUrl = _settingsService.serverUrl.isNotEmpty
        ? _settingsService.serverUrl
        : (_dotenv.env['BASE_URL'] ?? 'http://localhost:8080');

    final normalizedUrl = currentBaseUrl.endsWith('/') ? currentBaseUrl : '$currentBaseUrl/';

    if (_dio == null || _lastBaseUrl != normalizedUrl) {
      _dio = _createDio(normalizedUrl);
      _lastBaseUrl = normalizedUrl;
    }

    return _dio!;
  }

  Dio _createDio(String baseUrl) {
    final dio = Dio();

    dio.options.baseUrl = baseUrl;
    dio.options.connectTimeout = const Duration(milliseconds: 30000);
    dio.options.receiveTimeout = const Duration(milliseconds: 30000);
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
