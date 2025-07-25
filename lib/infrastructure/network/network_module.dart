import 'dart:async';

import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:injectable/injectable.dart';

import '../../domain/core/events/domain_event.dart';
import '../../domain/entities/events/settings_event.dart';
import '../config/config.dart';
import '../core/event_bus.dart';
import 'interceptors/interceptors.dart';
import 'network_info_service.dart';

@module
abstract class NetworkModule {
  @singleton
  DioFactory dioFactory(Config config, EventBus eventBus, NetworkInfoService networkInfo) {
    return DioFactory(config, eventBus, networkInfo);
  }

  @injectable
  Dio dio(DioFactory dioFactory) => dioFactory.dio;
}

class DioFactory {
  DioFactory(this._config, this._eventBus, this._networkInfo) {
    _lastBaseUrl = _config.baseUrl;
    _handleBaseUrlChange();
  }

  final Config _config;
  final NetworkInfoService _networkInfo;
  final EventBus _eventBus;
  StreamSubscription<DomainEvent>? _eventSubscription;

  Dio? _dio;
  late String _lastBaseUrl;

  Dio get dio {
    _dio ??= _createDio(_lastBaseUrl);
    return _dio!;
  }

  void _handleBaseUrlChange() {
    _eventSubscription = _eventBus.events.listen((event) {
      if (event is SettingsUpdateEvent) {
        _updateBaseUrl(event.settings.baseUrl);
      }
    });
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
    dio.interceptors.add(RetryInterceptor(dio: dio, retries: _config.retryAttempts, logPrint: print));
    dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true, logPrint: print));

    return dio;
  }

  void _updateBaseUrl(String baseUrl) {
    _lastBaseUrl = baseUrl;
    _dio = _createDio(_lastBaseUrl);
  }

  @disposeMethod
  void close() {
    _eventSubscription?.cancel();
    _eventSubscription = null;
  }
}
