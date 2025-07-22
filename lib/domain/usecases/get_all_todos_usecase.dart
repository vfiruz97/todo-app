import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../entities/failure.dart';
import '../entities/todo.dart';
import '../repositories/i_todo_repository.dart';

@injectable
class GetAllTodosUseCase {
  const GetAllTodosUseCase(this.repository);

  final ITodoRepository repository;

  Future<Either<Failure, List<Todo>>> call() async {
    return await repository.getAll();
  }
}
