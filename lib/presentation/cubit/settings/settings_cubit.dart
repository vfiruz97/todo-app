import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/entities/events/settings_event.dart';
import '../../../domain/entities/settings.dart';
import '../../../infrastructure/core/event_bus.dart';
import 'settings_state.dart';

@singleton
class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit(this._dotenv, this._eventBus) : super(const SettingsState()) {
    _loadBaseUrl();
  }

  final DotEnv _dotenv;
  final EventBus _eventBus;

  void _loadBaseUrl() {
    final baseUrl = _dotenv.env['BASE_URL'] ?? 'http://localhost:8080/api/v1';
    emit(state.copyWith(baseUrl: baseUrl));
  }

  void updateBaseUrl(String url) {
    emit(state.copyWith(baseUrl: url));
    _eventBus.emit(SettingsUpdateEvent(Settings(baseUrl: url)));
  }

  void resetToDefault() {
    final defaultUrl = _dotenv.env['BASE_URL'] ?? 'http://localhost:8080/api/v1';
    emit(state.copyWith(baseUrl: defaultUrl));
    _eventBus.emit(SettingsUpdateEvent(Settings(baseUrl: defaultUrl)));
  }
}
