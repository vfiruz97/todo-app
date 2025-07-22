import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../entities/failure.dart';
import '../entities/todo.dart';
import '../repositories/i_todo_repository.dart';

@injectable
class CreateTodoUseCase {
  const CreateTodoUseCase(this.repository);

  final ITodoRepository repository;

  Future<Either<Failure, Todo>> call(String title, String description) async {
    final todo = Todo.create(title: title, description: description);
    return await repository.create(todo);
  }
}
