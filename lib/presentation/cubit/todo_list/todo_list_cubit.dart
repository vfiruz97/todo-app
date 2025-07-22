import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/usecases/delete_todo_usecase.dart';
import '../../../domain/usecases/get_all_todos_usecase.dart';
import 'todo_list_state.dart';

@injectable
class TodoListCubit extends Cubit<TodoListState> {
  TodoListCubit(this._getAllTodosUseCase, this._deleteTodoUseCase) : super(const TodoListState.initial());

  final GetAllTodosUseCase _getAllTodosUseCase;
  final DeleteTodoUseCase _deleteTodoUseCase;

  void refresh() => loadTodos();

  Future<void> loadTodos() async {
    if (state is TodoListLoading) return;
    emit(const TodoListState.loading());

    final result = await _getAllTodosUseCase();

    result.fold(
      (failure) => emit(TodoListState.error(failure.toString())),
      (todos) => emit(TodoListState.loaded(todos)),
    );
  }

  Future<void> deleteTodo(int id) async {
    if (state is TodoListLoading) return;

    emit(const TodoListState.loading());

    final result = await _deleteTodoUseCase(id);

    result.fold((failure) => emit(TodoListState.error(failure.toString())), (_) => loadTodos());
  }
}
