import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings_state.freezed.dart';

enum ConnectionStatus { unknown, connected, disconnected, testing }

@freezed
class SettingsState with _$SettingsState {
  const factory SettingsState({
    @Default('') String serverUrl,
    @Default('') String savedServerUrl,
    @Default(ConnectionStatus.unknown) ConnectionStatus connectionStatus,
    @Default(false) bool isLoading,
    String? errorMessage,
  }) = _SettingsState;

  const SettingsState._();

  bool get hasUnsavedChanges => serverUrl != savedServerUrl;
}
