// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settings_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$SettingsState {
  String get serverUrl => throw _privateConstructorUsedError;
  String get savedServerUrl => throw _privateConstructorUsedError;
  ConnectionStatus get connectionStatus => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  /// Create a copy of SettingsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SettingsStateCopyWith<SettingsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingsStateCopyWith<$Res> {
  factory $SettingsStateCopyWith(
    SettingsState value,
    $Res Function(SettingsState) then,
  ) = _$SettingsStateCopyWithImpl<$Res, SettingsState>;
  @useResult
  $Res call({
    String serverUrl,
    String savedServerUrl,
    ConnectionStatus connectionStatus,
    bool isLoading,
    String? errorMessage,
  });
}

/// @nodoc
class _$SettingsStateCopyWithImpl<$Res, $Val extends SettingsState>
    implements $SettingsStateCopyWith<$Res> {
  _$SettingsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SettingsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serverUrl = null,
    Object? savedServerUrl = null,
    Object? connectionStatus = null,
    Object? isLoading = null,
    Object? errorMessage = freezed,
  }) {
    return _then(
      _value.copyWith(
            serverUrl: null == serverUrl
                ? _value.serverUrl
                : serverUrl // ignore: cast_nullable_to_non_nullable
                      as String,
            savedServerUrl: null == savedServerUrl
                ? _value.savedServerUrl
                : savedServerUrl // ignore: cast_nullable_to_non_nullable
                      as String,
            connectionStatus: null == connectionStatus
                ? _value.connectionStatus
                : connectionStatus // ignore: cast_nullable_to_non_nullable
                      as ConnectionStatus,
            isLoading: null == isLoading
                ? _value.isLoading
                : isLoading // ignore: cast_nullable_to_non_nullable
                      as bool,
            errorMessage: freezed == errorMessage
                ? _value.errorMessage
                : errorMessage // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SettingsStateImplCopyWith<$Res>
    implements $SettingsStateCopyWith<$Res> {
  factory _$$SettingsStateImplCopyWith(
    _$SettingsStateImpl value,
    $Res Function(_$SettingsStateImpl) then,
  ) = __$$SettingsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String serverUrl,
    String savedServerUrl,
    ConnectionStatus connectionStatus,
    bool isLoading,
    String? errorMessage,
  });
}

/// @nodoc
class __$$SettingsStateImplCopyWithImpl<$Res>
    extends _$SettingsStateCopyWithImpl<$Res, _$SettingsStateImpl>
    implements _$$SettingsStateImplCopyWith<$Res> {
  __$$SettingsStateImplCopyWithImpl(
    _$SettingsStateImpl _value,
    $Res Function(_$SettingsStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SettingsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serverUrl = null,
    Object? savedServerUrl = null,
    Object? connectionStatus = null,
    Object? isLoading = null,
    Object? errorMessage = freezed,
  }) {
    return _then(
      _$SettingsStateImpl(
        serverUrl: null == serverUrl
            ? _value.serverUrl
            : serverUrl // ignore: cast_nullable_to_non_nullable
                  as String,
        savedServerUrl: null == savedServerUrl
            ? _value.savedServerUrl
            : savedServerUrl // ignore: cast_nullable_to_non_nullable
                  as String,
        connectionStatus: null == connectionStatus
            ? _value.connectionStatus
            : connectionStatus // ignore: cast_nullable_to_non_nullable
                  as ConnectionStatus,
        isLoading: null == isLoading
            ? _value.isLoading
            : isLoading // ignore: cast_nullable_to_non_nullable
                  as bool,
        errorMessage: freezed == errorMessage
            ? _value.errorMessage
            : errorMessage // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$SettingsStateImpl extends _SettingsState {
  const _$SettingsStateImpl({
    this.serverUrl = '',
    this.savedServerUrl = '',
    this.connectionStatus = ConnectionStatus.unknown,
    this.isLoading = false,
    this.errorMessage,
  }) : super._();

  @override
  @JsonKey()
  final String serverUrl;
  @override
  @JsonKey()
  final String savedServerUrl;
  @override
  @JsonKey()
  final ConnectionStatus connectionStatus;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'SettingsState(serverUrl: $serverUrl, savedServerUrl: $savedServerUrl, connectionStatus: $connectionStatus, isLoading: $isLoading, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SettingsStateImpl &&
            (identical(other.serverUrl, serverUrl) ||
                other.serverUrl == serverUrl) &&
            (identical(other.savedServerUrl, savedServerUrl) ||
                other.savedServerUrl == savedServerUrl) &&
            (identical(other.connectionStatus, connectionStatus) ||
                other.connectionStatus == connectionStatus) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    serverUrl,
    savedServerUrl,
    connectionStatus,
    isLoading,
    errorMessage,
  );

  /// Create a copy of SettingsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SettingsStateImplCopyWith<_$SettingsStateImpl> get copyWith =>
      __$$SettingsStateImplCopyWithImpl<_$SettingsStateImpl>(this, _$identity);
}

abstract class _SettingsState extends SettingsState {
  const factory _SettingsState({
    final String serverUrl,
    final String savedServerUrl,
    final ConnectionStatus connectionStatus,
    final bool isLoading,
    final String? errorMessage,
  }) = _$SettingsStateImpl;
  const _SettingsState._() : super._();

  @override
  String get serverUrl;
  @override
  String get savedServerUrl;
  @override
  ConnectionStatus get connectionStatus;
  @override
  bool get isLoading;
  @override
  String? get errorMessage;

  /// Create a copy of SettingsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SettingsStateImplCopyWith<_$SettingsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
