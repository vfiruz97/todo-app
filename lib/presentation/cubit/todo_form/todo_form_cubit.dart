import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:injectable/injectable.dart';

import '../../../application/services/todo_service.dart';
import '../../../domain/core/events/domain_event.dart';
import '../../../domain/entities/events/todo_events.dart';
import '../../../domain/entities/todo.dart';
import '../../../infrastructure/core/event_bus.dart';
import '../../validators/todo_validators.dart';
import 'todo_form_state.dart';

@injectable
class TodoFormCubit extends Cubit<TodoFormState> {
  TodoFormCubit(this._todoService, this._eventBus) : super(const TodoFormState()) {
    _initEventListener();
  }

  final TodoService _todoService;
  final EventBus _eventBus;
  StreamSubscription<DomainEvent>? _eventSubscription;

  void _initEventListener() {
    _eventSubscription = _eventBus.events.listen((event) {
      if (event is TodoUpdatedEvent && state.todo?.id == event.todo.id) {
        updateTodoInState(event.todo);
      }
    });
  }

  /// Loads a todo by its ID and updates the form state
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

  /// Toggles the completion status of the current todo
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

  /// Updates the todo in the state if it matches the ID
  void updateTodoInState(Todo updatedTodo) {
    if (state.todo?.id == updatedTodo.id) {
      emit(state.copyWith(todo: updatedTodo));
    }
  }

  /// Initializes the form with an existing todo
  void initializeForm(Todo? todo) {
    if (todo == null) return;
    final titleInput = TitleInput.dirty(todo.title);
    final descriptionInput = DescriptionInput.dirty(todo.description);
    final isValid = Formz.validate([titleInput, descriptionInput]);

    emit(state.copyWith(todo: todo, title: titleInput, description: descriptionInput, isValid: isValid));
  }

  /// Updates the title in the form state
  void titleChanged(String value) {
    final title = TitleInput.dirty(value);
    final isValid = Formz.validate([title, state.description]);
    emit(state.copyWith(title: title, isValid: isValid));
  }

  /// Updates the description in the form state
  void descriptionChanged(String value) {
    final description = DescriptionInput.dirty(value);
    final isValid = Formz.validate([state.title, description]);
    emit(state.copyWith(description: description, isValid: isValid));
  }

  /// Submits the form to create or update a todo
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

  @override
  Future<void> close() async {
    await _eventSubscription?.cancel();
    return super.close();
  }
}
