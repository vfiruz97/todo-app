import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:injectable/injectable.dart';

import '../../../application/services/todo_service.dart';
import '../../../domain/entities/todo.dart';
import '../../validators/todo_validators.dart';
import 'todo_form_state.dart';

@injectable
class TodoFormCubit extends Cubit<TodoFormState> {
  TodoFormCubit(this._todoService) : super(const TodoFormState());

  final TodoService _todoService;

  Future<void> loadTodo(int id) async {
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));

    final result = await _todoService.getById(id);

    result.fold(
      (failure) => emit(state.copyWith(status: FormzSubmissionStatus.failure, errorMessage: failure.toString())),
      (todo) {
        final titleInput = TitleInput.dirty(todo.title);
        final descriptionInput = DescriptionInput.dirty(todo.description);
        final isValid = Formz.validate([titleInput, descriptionInput]);

        emit(
          state.copyWith(
            todo: todo,
            title: titleInput,
            description: descriptionInput,
            isValid: isValid,
            status: FormzSubmissionStatus.success,
          ),
        );
      },
    );
  }

  Future<void> toggleCompletion() async {
    if (state.todo == null) return;

    final updatedTodo = state.todo!.copyWith(isCompleted: !state.todo!.isCompleted);

    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));

    final result = await _todoService.update(updatedTodo);

    result.fold(
      (failure) => emit(state.copyWith(status: FormzSubmissionStatus.failure, errorMessage: failure.toString())),
      (todo) => emit(state.copyWith(todo: todo, status: FormzSubmissionStatus.success)),
    );
  }

  void updateTodoInState(Todo updatedTodo) {
    if (state.todo?.id == updatedTodo.id) {
      emit(state.copyWith(todo: updatedTodo));
    }
  }

  void initializeForm(Todo? todo) {
    if (todo == null) return;
    final titleInput = TitleInput.dirty(todo.title);
    final descriptionInput = DescriptionInput.dirty(todo.description);
    final isValid = Formz.validate([titleInput, descriptionInput]);

    emit(state.copyWith(todo: todo, title: titleInput, description: descriptionInput, isValid: isValid));
  }

  void titleChanged(String value) {
    final title = TitleInput.dirty(value);
    final isValid = Formz.validate([title, state.description]);
    emit(state.copyWith(title: title, isValid: isValid));
  }

  void descriptionChanged(String value) {
    final description = DescriptionInput.dirty(value);
    final isValid = Formz.validate([state.title, description]);
    emit(state.copyWith(description: description, isValid: isValid));
  }

  Future<void> submitForm() async {
    if (state.status == FormzSubmissionStatus.inProgress) return;
    if (!state.isValid) return;

    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));

    final result = state.todo == null
        ? await _todoService.create(Todo.create(title: state.title.value, description: state.description.value))
        : await _todoService.update(
            state.todo!.copyWith(title: state.title.value, description: state.description.value),
          );

    result.fold(
      (failure) => emit(state.copyWith(status: FormzSubmissionStatus.failure, errorMessage: failure.toString())),
      (_) => emit(state.copyWith(status: FormzSubmissionStatus.success)),
    );
  }
}
