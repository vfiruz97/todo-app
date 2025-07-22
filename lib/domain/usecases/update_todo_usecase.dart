import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../entities/failure.dart';
import '../entities/todo.dart';
import '../repositories/i_todo_repository.dart';

@injectable
class UpdateTodoUseCase {
  const UpdateTodoUseCase(this.repository);

  final ITodoRepository repository;

  Future<Either<Failure, Todo>> call(Todo todo) async {
    final updatedTodo = todo.copyWith(updatedAt: DateTime.now());
    return await repository.update(updatedTodo);
  }
}
