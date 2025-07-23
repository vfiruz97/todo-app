import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/entities/events/settings_event.dart';
import '../../../domain/entities/settings.dart';
import '../../../infrastructure/config/config.dart';
import '../../../infrastructure/core/event_bus.dart';
import 'settings_state.dart';

@singleton
class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit(this._config, this._eventBus) : super(const SettingsState()) {
    _loadBaseUrl();
  }

  final Config _config;
  final EventBus _eventBus;

  void _loadBaseUrl() {
    final baseUrl = _config.baseUrl;
    emit(state.copyWith(baseUrl: baseUrl));
  }

  void updateBaseUrl(String url) {
    emit(state.copyWith(baseUrl: url));
    _eventBus.emit(SettingsUpdateEvent(Settings(baseUrl: url)));
  }

  void resetToDefault() {
    final defaultUrl = _config.baseUrl;
    emit(state.copyWith(baseUrl: defaultUrl));
    _eventBus.emit(SettingsUpdateEvent(Settings(baseUrl: defaultUrl)));
  }
}
