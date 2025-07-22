// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$TodoListState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Todo> todos) loaded,
    required TResult Function(String message) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Todo> todos)? loaded,
    TResult? Function(String message)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Todo> todos)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TodoListInitial value) initial,
    required TResult Function(TodoListLoading value) loading,
    required TResult Function(TodoListLoaded value) loaded,
    required TResult Function(TodoListError value) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TodoListInitial value)? initial,
    TResult? Function(TodoListLoading value)? loading,
    TResult? Function(TodoListLoaded value)? loaded,
    TResult? Function(TodoListError value)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TodoListInitial value)? initial,
    TResult Function(TodoListLoading value)? loading,
    TResult Function(TodoListLoaded value)? loaded,
    TResult Function(TodoListError value)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoListStateCopyWith<$Res> {
  factory $TodoListStateCopyWith(
    TodoListState value,
    $Res Function(TodoListState) then,
  ) = _$TodoListStateCopyWithImpl<$Res, TodoListState>;
}

/// @nodoc
class _$TodoListStateCopyWithImpl<$Res, $Val extends TodoListState>
    implements $TodoListStateCopyWith<$Res> {
  _$TodoListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TodoListState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$TodoListInitialImplCopyWith<$Res> {
  factory _$$TodoListInitialImplCopyWith(
    _$TodoListInitialImpl value,
    $Res Function(_$TodoListInitialImpl) then,
  ) = __$$TodoListInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TodoListInitialImplCopyWithImpl<$Res>
    extends _$TodoListStateCopyWithImpl<$Res, _$TodoListInitialImpl>
    implements _$$TodoListInitialImplCopyWith<$Res> {
  __$$TodoListInitialImplCopyWithImpl(
    _$TodoListInitialImpl _value,
    $Res Function(_$TodoListInitialImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TodoListState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$TodoListInitialImpl implements TodoListInitial {
  const _$TodoListInitialImpl();

  @override
  String toString() {
    return 'TodoListState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$TodoListInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Todo> todos) loaded,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Todo> todos)? loaded,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Todo> todos)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TodoListInitial value) initial,
    required TResult Function(TodoListLoading value) loading,
    required TResult Function(TodoListLoaded value) loaded,
    required TResult Function(TodoListError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TodoListInitial value)? initial,
    TResult? Function(TodoListLoading value)? loading,
    TResult? Function(TodoListLoaded value)? loaded,
    TResult? Function(TodoListError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TodoListInitial value)? initial,
    TResult Function(TodoListLoading value)? loading,
    TResult Function(TodoListLoaded value)? loaded,
    TResult Function(TodoListError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class TodoListInitial implements TodoListState {
  const factory TodoListInitial() = _$TodoListInitialImpl;
}

/// @nodoc
abstract class _$$TodoListLoadingImplCopyWith<$Res> {
  factory _$$TodoListLoadingImplCopyWith(
    _$TodoListLoadingImpl value,
    $Res Function(_$TodoListLoadingImpl) then,
  ) = __$$TodoListLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TodoListLoadingImplCopyWithImpl<$Res>
    extends _$TodoListStateCopyWithImpl<$Res, _$TodoListLoadingImpl>
    implements _$$TodoListLoadingImplCopyWith<$Res> {
  __$$TodoListLoadingImplCopyWithImpl(
    _$TodoListLoadingImpl _value,
    $Res Function(_$TodoListLoadingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TodoListState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$TodoListLoadingImpl implements TodoListLoading {
  const _$TodoListLoadingImpl();

  @override
  String toString() {
    return 'TodoListState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$TodoListLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Todo> todos) loaded,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Todo> todos)? loaded,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Todo> todos)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TodoListInitial value) initial,
    required TResult Function(TodoListLoading value) loading,
    required TResult Function(TodoListLoaded value) loaded,
    required TResult Function(TodoListError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TodoListInitial value)? initial,
    TResult? Function(TodoListLoading value)? loading,
    TResult? Function(TodoListLoaded value)? loaded,
    TResult? Function(TodoListError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TodoListInitial value)? initial,
    TResult Function(TodoListLoading value)? loading,
    TResult Function(TodoListLoaded value)? loaded,
    TResult Function(TodoListError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class TodoListLoading implements TodoListState {
  const factory TodoListLoading() = _$TodoListLoadingImpl;
}

/// @nodoc
abstract class _$$TodoListLoadedImplCopyWith<$Res> {
  factory _$$TodoListLoadedImplCopyWith(
    _$TodoListLoadedImpl value,
    $Res Function(_$TodoListLoadedImpl) then,
  ) = __$$TodoListLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Todo> todos});
}

/// @nodoc
class __$$TodoListLoadedImplCopyWithImpl<$Res>
    extends _$TodoListStateCopyWithImpl<$Res, _$TodoListLoadedImpl>
    implements _$$TodoListLoadedImplCopyWith<$Res> {
  __$$TodoListLoadedImplCopyWithImpl(
    _$TodoListLoadedImpl _value,
    $Res Function(_$TodoListLoadedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TodoListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? todos = null}) {
    return _then(
      _$TodoListLoadedImpl(
        null == todos
            ? _value._todos
            : todos // ignore: cast_nullable_to_non_nullable
                  as List<Todo>,
      ),
    );
  }
}

/// @nodoc

class _$TodoListLoadedImpl implements TodoListLoaded {
  const _$TodoListLoadedImpl(final List<Todo> todos) : _todos = todos;

  final List<Todo> _todos;
  @override
  List<Todo> get todos {
    if (_todos is EqualUnmodifiableListView) return _todos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_todos);
  }

  @override
  String toString() {
    return 'TodoListState.loaded(todos: $todos)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TodoListLoadedImpl &&
            const DeepCollectionEquality().equals(other._todos, _todos));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_todos));

  /// Create a copy of TodoListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TodoListLoadedImplCopyWith<_$TodoListLoadedImpl> get copyWith =>
      __$$TodoListLoadedImplCopyWithImpl<_$TodoListLoadedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Todo> todos) loaded,
    required TResult Function(String message) error,
  }) {
    return loaded(todos);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Todo> todos)? loaded,
    TResult? Function(String message)? error,
  }) {
    return loaded?.call(todos);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Todo> todos)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(todos);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TodoListInitial value) initial,
    required TResult Function(TodoListLoading value) loading,
    required TResult Function(TodoListLoaded value) loaded,
    required TResult Function(TodoListError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TodoListInitial value)? initial,
    TResult? Function(TodoListLoading value)? loading,
    TResult? Function(TodoListLoaded value)? loaded,
    TResult? Function(TodoListError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TodoListInitial value)? initial,
    TResult Function(TodoListLoading value)? loading,
    TResult Function(TodoListLoaded value)? loaded,
    TResult Function(TodoListError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class TodoListLoaded implements TodoListState {
  const factory TodoListLoaded(final List<Todo> todos) = _$TodoListLoadedImpl;

  List<Todo> get todos;

  /// Create a copy of TodoListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TodoListLoadedImplCopyWith<_$TodoListLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TodoListErrorImplCopyWith<$Res> {
  factory _$$TodoListErrorImplCopyWith(
    _$TodoListErrorImpl value,
    $Res Function(_$TodoListErrorImpl) then,
  ) = __$$TodoListErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$TodoListErrorImplCopyWithImpl<$Res>
    extends _$TodoListStateCopyWithImpl<$Res, _$TodoListErrorImpl>
    implements _$$TodoListErrorImplCopyWith<$Res> {
  __$$TodoListErrorImplCopyWithImpl(
    _$TodoListErrorImpl _value,
    $Res Function(_$TodoListErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TodoListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$TodoListErrorImpl(
        null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$TodoListErrorImpl implements TodoListError {
  const _$TodoListErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'TodoListState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TodoListErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of TodoListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TodoListErrorImplCopyWith<_$TodoListErrorImpl> get copyWith =>
      __$$TodoListErrorImplCopyWithImpl<_$TodoListErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Todo> todos) loaded,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Todo> todos)? loaded,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Todo> todos)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TodoListInitial value) initial,
    required TResult Function(TodoListLoading value) loading,
    required TResult Function(TodoListLoaded value) loaded,
    required TResult Function(TodoListError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TodoListInitial value)? initial,
    TResult? Function(TodoListLoading value)? loading,
    TResult? Function(TodoListLoaded value)? loaded,
    TResult? Function(TodoListError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TodoListInitial value)? initial,
    TResult Function(TodoListLoading value)? loading,
    TResult Function(TodoListLoaded value)? loaded,
    TResult Function(TodoListError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class TodoListError implements TodoListState {
  const factory TodoListError(final String message) = _$TodoListErrorImpl;

  String get message;

  /// Create a copy of TodoListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TodoListErrorImplCopyWith<_$TodoListErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
