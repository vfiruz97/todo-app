import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo.freezed.dart';
part 'todo.g.dart';

@freezed
abstract class Todo with _$Todo {
  const Todo._();

  const factory Todo({
    int? id,
    required String title,
    required String description,
    @Default(false) bool isCompleted,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Todo;

  factory Todo.create({required String title, required String description}) {
    final now = DateTime.now();
    return Todo(title: title, description: description, isCompleted: false, createdAt: now, updatedAt: now);
  }

  factory Todo.fromJson(Map<String, dynamic> json) => _$TodoFromJson(json);
}
