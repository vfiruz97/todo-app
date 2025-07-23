import 'package:dio/dio.dart';

import '../network_info_service.dart';

/// Interceptor that checks network connectivity before allowing requests to proceed
class ConnectivityInterceptor extends Interceptor {
  const ConnectivityInterceptor(this._networkInfoService);

  final NetworkInfoService _networkInfoService;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final isConnected = await _networkInfoService.isConnected;

    if (!isConnected) {
      handler.reject(DioException.connectionError(requestOptions: options, reason: 'No internet connection available'));
      return;
    }

    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (_isConnectivityError(err)) {
      final isConnected = await _networkInfoService.isConnected;

      if (!isConnected) {
        handler.reject(
          DioException.connectionError(requestOptions: err.requestOptions, reason: 'No internet connection available'),
        );
        return;
      }
    }

    handler.next(err);
  }

  bool _isConnectivityError(DioException error) {
    return error.type == DioExceptionType.connectionError ||
        error.type == DioExceptionType.connectionTimeout ||
        error.type == DioExceptionType.receiveTimeout ||
        error.type == DioExceptionType.sendTimeout;
  }
}
