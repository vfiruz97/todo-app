import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../application/services/todo_service.dart';
import 'todo_list_state.dart';

@singleton
class TodoListCubit extends Cubit<TodoListState> {
  TodoListCubit(this._todoService) : super(const TodoListState.initial()) {
    _initConnectivityListener();
  }

  final TodoService _todoService;
  StreamSubscription<bool>? _connectivitySubscription;

  /// Initializes a listener for connectivity changes
  void _initConnectivityListener() {
    _connectivitySubscription = _todoService.onConnectivityChanged.listen((isConnected) {
      if (isConnected && state is TodoListError) {
        loadTodos();
      }
    });
  }

  /// Refreshes the todo list
  void refresh() => loadTodos();

  /// Loads all todos from the service
  Future<void> loadTodos() async {
    if (state is TodoListLoading) return;
    emit(const TodoListState.loading());

    final result = await _todoService.getAll();

    result.fold(
      (failure) => emit(TodoListState.error(failure.toString())),
      (todos) => emit(TodoListState.loaded(todos)),
    );
  }

  /// Deletes a todo by its ID
  Future<void> delete(int id) async {
    if (state is TodoListLoading) return;
    emit(const TodoListState.loading());

    final result = await _todoService.delete(id);

    result.fold((failure) => emit(TodoListState.error(failure.toString())), (_) {
      emit(const TodoListState.initial());
      return loadTodos();
    });
  }

  /// Returns whether the network is available
  Future<bool> get isNetworkAvailable => _todoService.isNetworkAvailable;

  /// Syncs todos when a network connection is available
  Future<void> syncWhenConnected() async {
    if (await _todoService.isNetworkAvailable) {
      await loadTodos();
    }
  }

  @override
  Future<void> close() async {
    await _connectivitySubscription?.cancel();
    return super.close();
  }
}
