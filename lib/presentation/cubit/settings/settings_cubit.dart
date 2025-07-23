import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';

import '../../../infrastructure/network/network_module.dart';
import 'settings_state.dart';

@singleton
class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit(this._dotenv, this._dioFactory) : super(const SettingsState()) {
    _loadBaseUrl();
  }

  final DotEnv _dotenv;
  final DioFactory _dioFactory;

  void _loadBaseUrl() {
    final baseUrl = _dotenv.env['BASE_URL'] ?? 'http://localhost:8080/api/v1';
    emit(state.copyWith(baseUrl: baseUrl));
  }

  void updateBaseUrl(String url) {
    emit(state.copyWith(baseUrl: url));
    _dioFactory.recreateDio(url);
  }

  void resetToDefault() {
    final defaultUrl = _dotenv.env['BASE_URL'] ?? 'http://localhost:8080/api/v1';
    emit(state.copyWith(baseUrl: defaultUrl));
    _dioFactory.recreateDio(defaultUrl);
  }
}
