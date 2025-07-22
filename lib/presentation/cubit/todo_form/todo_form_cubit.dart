import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/entities/todo.dart';
import '../../../domain/usecases/create_todo_usecase.dart';
import '../../../domain/usecases/update_todo_usecase.dart';
import '../../validators/todo_validators.dart';
import 'todo_form_state.dart';

@injectable
class TodoFormCubit extends Cubit<TodoFormState> {
  final CreateTodoUseCase _createTodoUseCase;
  final UpdateTodoUseCase _updateTodoUseCase;

  TodoFormCubit(this._createTodoUseCase, this._updateTodoUseCase) : super(const TodoFormState());

  void initializeForm(Todo? todo) {
    if (todo != null) {
      emit(
        state.copyWith(
          todo: todo,
          title: TitleInput.dirty(todo.title),
          description: DescriptionInput.dirty(todo.description),
        ),
      );
    }
  }

  void titleChanged(String value) {
    final title = TitleInput.dirty(value);
    emit(state.copyWith(title: title, status: Formz.validate([title, state.description])));
  }

  void descriptionChanged(String value) {
    final description = DescriptionInput.dirty(value);
    emit(state.copyWith(description: description, status: Formz.validate([state.title, description])));
  }

  Future<void> submitForm() async {
    if (!state.status.isValidated) return;

    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));

    final result = state.todo == null
        ? await _createTodoUseCase(state.title.value, state.description.value)
        : await _updateTodoUseCase(
            state.todo!.copyWith(
              title: state.title.value,
              description: state.description.value,
              updatedAt: DateTime.now(),
            ),
          );

    result.fold(
      (failure) => emit(state.copyWith(status: FormzSubmissionStatus.failure, errorMessage: failure.toString())),
      (_) => emit(state.copyWith(status: FormzSubmissionStatus.success)),
    );
  }
}
