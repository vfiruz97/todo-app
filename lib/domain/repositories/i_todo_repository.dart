import 'package:dartz/dartz.dart';

import '../entities/failure.dart';
import '../entities/todo.dart';

abstract class ITodoRepository {
  Future<Either<Failure, List<Todo>>> getAll();
  Future<Either<Failure, Todo>> getById(int id);
  Future<Either<Failure, Todo>> create(Todo todo);
  Future<Either<Failure, Todo>> update(Todo todo);
  Future<Either<Failure, Unit>> delete(int id);
}
