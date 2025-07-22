import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/todo.dart';

part 'todo_list_state.freezed.dart';

@freezed
class TodoListState with _$TodoListState {
  const factory TodoListState.initial() = TodoListInitial;
  const factory TodoListState.loading() = TodoListLoading;
  const factory TodoListState.loaded(List<Todo> todos) = TodoListLoaded;
  const factory TodoListState.error(String message) = TodoListError;
}
