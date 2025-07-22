import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/todo.dart';
import '../../validators/todo_validators.dart';

part 'todo_form_state.freezed.dart';

@freezed
class TodoFormState with _$TodoFormState {
  const factory TodoFormState({
    @Default(TitleInput.pure()) TitleInput title,
    @Default(DescriptionInput.pure()) DescriptionInput description,
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus status,
    Todo? todo,
    String? errorMessage,
  }) = _TodoFormState;
}
