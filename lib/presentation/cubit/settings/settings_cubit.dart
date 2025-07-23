import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../application/services/settings_service.dart';
import '../../../infrastructure/network/network_info_service.dart';
import '../../../injection.dart';
import 'settings_state.dart';

@injectable
class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit(this._settingsService) : super(const SettingsState()) {
    _loadSettings();
  }

  final SettingsService _settingsService;

  void _loadSettings() {
    final serverUrl = _settingsService.serverUrl;
    emit(state.copyWith(serverUrl: serverUrl, savedServerUrl: serverUrl));
  }

  void updateServerUrl(String url) {
    emit(state.copyWith(serverUrl: url));
  }

  Future<void> saveSettings() async {
    if (!state.hasUnsavedChanges) return;

    emit(state.copyWith(isLoading: true));

    try {
      final success = await _settingsService.setServerUrl(state.serverUrl);
      if (success) {
        emit(state.copyWith(savedServerUrl: state.serverUrl, isLoading: false, errorMessage: null));
      } else {
        emit(state.copyWith(isLoading: false, errorMessage: 'Failed to save settings'));
      }
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }

  Future<void> resetToDefault() async {
    emit(state.copyWith(isLoading: true));

    try {
      await _settingsService.resetServerUrl();
      final defaultUrl = _settingsService.serverUrl;
      emit(state.copyWith(serverUrl: defaultUrl, savedServerUrl: defaultUrl, isLoading: false, errorMessage: null));
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }

  Future<void> testConnection() async {
    emit(state.copyWith(connectionStatus: ConnectionStatus.testing));

    try {
      final networkInfo = getIt<NetworkInfoService>();
      final isConnected = await networkInfo.isConnected;

      if (isConnected) {
        emit(state.copyWith(connectionStatus: ConnectionStatus.connected));
      } else {
        emit(state.copyWith(connectionStatus: ConnectionStatus.disconnected));
      }
    } catch (e) {
      emit(state.copyWith(connectionStatus: ConnectionStatus.disconnected, errorMessage: e.toString()));
    }
  }
}
