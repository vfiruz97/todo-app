import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../application/services/todo_service.dart';
import '../../../domain/core/events/domain_event.dart';
import '../../../domain/entities/events/todo_events.dart';
import '../../../domain/entities/todo.dart';
import '../../../infrastructure/core/event_bus.dart';
import 'todo_list_state.dart';

@singleton
class TodoListCubit extends Cubit<TodoListState> {
  TodoListCubit(this._todoService, this._eventBus) : super(const TodoListState.initial()) {
    _initConnectivityListener();
    _initEventListener();
  }

  final TodoService _todoService;
  final EventBus _eventBus;
  StreamSubscription<bool>? _connectivitySubscription;
  StreamSubscription<DomainEvent>? _eventSubscription;

  /// Initializes a listener for connectivity changes
  void _initConnectivityListener() {
    _connectivitySubscription = _todoService.onConnectivityChanged.listen((isConnected) {
      if (isConnected && state is TodoListError) {
        loadTodos();
      }
    });
  }

  /// Initializes a listener for domain events
  void _initEventListener() {
    _eventSubscription = _eventBus.events.listen((event) {
      if (event is TodoCreatedEvent) {
        _handleTodoCreated(event.todo);
      } else if (event is TodoUpdatedEvent) {
        _handleTodoUpdated(event.todo);
      } else if (event is TodoDeletedEvent) {
        _handleTodoDeleted(event.todoId);
      }
    });
  }

  void _handleTodoCreated(Todo todo) {
    final currentTodos = (state as TodoListLoaded).todos;
    emit(TodoListState.loaded([todo, ...currentTodos]));
  }

  void _handleTodoUpdated(Todo updatedTodo) {
    final currentTodos = (state as TodoListLoaded).todos;
    final updatedTodos = currentTodos.map((todo) {
      return todo.id == updatedTodo.id ? updatedTodo : todo;
    }).toList();
    emit(TodoListState.loaded(updatedTodos));
  }

  void _handleTodoDeleted(_) => loadTodos();

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

    result.fold((failure) => emit(TodoListState.error(failure.toString())), (_) => emit(const TodoListState.initial()));
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
    await _eventSubscription?.cancel();
    return super.close();
  }
}
