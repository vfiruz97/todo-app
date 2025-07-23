import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/failure.dart';
import '../../domain/entities/todo.dart';
import '../../domain/repositories/i_todo_repository.dart';
import '../../infrastructure/network/network_info_service.dart';

@injectable
class TodoService {
  const TodoService(this._todoRepository, this._networkInfoService);

  final ITodoRepository _todoRepository;
  final NetworkInfoService _networkInfoService;

  Future<Either<Failure, List<Todo>>> getAll() async {
    if (!await _networkInfoService.isConnected) {
      return const Left(Failure.networkError());
    }

    return await _todoRepository.getAll();
  }

  Future<Either<Failure, Todo>> getById(int id) async {
    if (!await _networkInfoService.isConnected) {
      return const Left(Failure.networkError());
    }

    return await _todoRepository.getById(id);
  }

  Future<Either<Failure, Todo>> create(Todo todo) async {
    if (!await _networkInfoService.isConnected) {
      return const Left(Failure.networkError());
    }

    return await _todoRepository.create(todo);
  }

  Future<Either<Failure, Todo>> update(Todo todo) async {
    if (!await _networkInfoService.isConnected) {
      return const Left(Failure.networkError());
    }

    return await _todoRepository.update(todo);
  }

  Future<Either<Failure, Unit>> delete(int id) async {
    if (!await _networkInfoService.isConnected) {
      return const Left(Failure.networkError());
    }

    return await _todoRepository.delete(id);
  }

  Future<bool> get isNetworkAvailable => _networkInfoService.isConnected;

  Stream<bool> get onConnectivityChanged => _networkInfoService.onConnectivityChanged;

  Future<Either<Failure, List<Todo>>> syncTodos() async {
    return await getAll();
  }
}
