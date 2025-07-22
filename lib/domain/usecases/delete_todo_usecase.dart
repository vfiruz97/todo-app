import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../entities/failure.dart';
import '../repositories/i_todo_repository.dart';

@injectable
class DeleteTodoUseCase {
  const DeleteTodoUseCase(this.repository);

  final ITodoRepository repository;

  Future<Either<Failure, Unit>> call(int id) async {
    return await repository.delete(id);
  }
}
