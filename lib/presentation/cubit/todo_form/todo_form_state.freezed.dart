// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo_form_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$TodoFormState {
  TitleInput get title => throw _privateConstructorUsedError;
  DescriptionInput get description => throw _privateConstructorUsedError;
  FormzSubmissionStatus get status => throw _privateConstructorUsedError;
  bool get isValid => throw _privateConstructorUsedError;
  Todo? get todo => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  /// Create a copy of TodoFormState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TodoFormStateCopyWith<TodoFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoFormStateCopyWith<$Res> {
  factory $TodoFormStateCopyWith(
    TodoFormState value,
    $Res Function(TodoFormState) then,
  ) = _$TodoFormStateCopyWithImpl<$Res, TodoFormState>;
  @useResult
  $Res call({
    TitleInput title,
    DescriptionInput description,
    FormzSubmissionStatus status,
    bool isValid,
    Todo? todo,
    String? errorMessage,
  });

  $TodoCopyWith<$Res>? get todo;
}

/// @nodoc
class _$TodoFormStateCopyWithImpl<$Res, $Val extends TodoFormState>
    implements $TodoFormStateCopyWith<$Res> {
  _$TodoFormStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TodoFormState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
    Object? status = null,
    Object? isValid = null,
    Object? todo = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(
      _value.copyWith(
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as TitleInput,
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as DescriptionInput,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as FormzSubmissionStatus,
            isValid: null == isValid
                ? _value.isValid
                : isValid // ignore: cast_nullable_to_non_nullable
                      as bool,
            todo: freezed == todo
                ? _value.todo
                : todo // ignore: cast_nullable_to_non_nullable
                      as Todo?,
            errorMessage: freezed == errorMessage
                ? _value.errorMessage
                : errorMessage // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }

  /// Create a copy of TodoFormState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TodoCopyWith<$Res>? get todo {
    if (_value.todo == null) {
      return null;
    }

    return $TodoCopyWith<$Res>(_value.todo!, (value) {
      return _then(_value.copyWith(todo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TodoFormStateImplCopyWith<$Res>
    implements $TodoFormStateCopyWith<$Res> {
  factory _$$TodoFormStateImplCopyWith(
    _$TodoFormStateImpl value,
    $Res Function(_$TodoFormStateImpl) then,
  ) = __$$TodoFormStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    TitleInput title,
    DescriptionInput description,
    FormzSubmissionStatus status,
    bool isValid,
    Todo? todo,
    String? errorMessage,
  });

  @override
  $TodoCopyWith<$Res>? get todo;
}

/// @nodoc
class __$$TodoFormStateImplCopyWithImpl<$Res>
    extends _$TodoFormStateCopyWithImpl<$Res, _$TodoFormStateImpl>
    implements _$$TodoFormStateImplCopyWith<$Res> {
  __$$TodoFormStateImplCopyWithImpl(
    _$TodoFormStateImpl _value,
    $Res Function(_$TodoFormStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TodoFormState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
    Object? status = null,
    Object? isValid = null,
    Object? todo = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(
      _$TodoFormStateImpl(
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as TitleInput,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as DescriptionInput,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as FormzSubmissionStatus,
        isValid: null == isValid
            ? _value.isValid
            : isValid // ignore: cast_nullable_to_non_nullable
                  as bool,
        todo: freezed == todo
            ? _value.todo
            : todo // ignore: cast_nullable_to_non_nullable
                  as Todo?,
        errorMessage: freezed == errorMessage
            ? _value.errorMessage
            : errorMessage // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$TodoFormStateImpl implements _TodoFormState {
  const _$TodoFormStateImpl({
    this.title = const TitleInput.pure(),
    this.description = const DescriptionInput.pure(),
    this.status = FormzSubmissionStatus.initial,
    this.isValid = false,
    this.todo,
    this.errorMessage,
  });

  @override
  @JsonKey()
  final TitleInput title;
  @override
  @JsonKey()
  final DescriptionInput description;
  @override
  @JsonKey()
  final FormzSubmissionStatus status;
  @override
  @JsonKey()
  final bool isValid;
  @override
  final Todo? todo;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'TodoFormState(title: $title, description: $description, status: $status, isValid: $isValid, todo: $todo, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TodoFormStateImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.isValid, isValid) || other.isValid == isValid) &&
            (identical(other.todo, todo) || other.todo == todo) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    title,
    description,
    status,
    isValid,
    todo,
    errorMessage,
  );

  /// Create a copy of TodoFormState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TodoFormStateImplCopyWith<_$TodoFormStateImpl> get copyWith =>
      __$$TodoFormStateImplCopyWithImpl<_$TodoFormStateImpl>(this, _$identity);
}

abstract class _TodoFormState implements TodoFormState {
  const factory _TodoFormState({
    final TitleInput title,
    final DescriptionInput description,
    final FormzSubmissionStatus status,
    final bool isValid,
    final Todo? todo,
    final String? errorMessage,
  }) = _$TodoFormStateImpl;

  @override
  TitleInput get title;
  @override
  DescriptionInput get description;
  @override
  FormzSubmissionStatus get status;
  @override
  bool get isValid;
  @override
  Todo? get todo;
  @override
  String? get errorMessage;

  /// Create a copy of TodoFormState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TodoFormStateImplCopyWith<_$TodoFormStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
