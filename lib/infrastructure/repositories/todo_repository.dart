import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_proto/todo_proto.dart' as proto;

import '../../domain/entities/events/todo_events.dart';
import '../../domain/entities/failure.dart';
import '../../domain/entities/todo.dart';
import '../../domain/repositories/i_todo_repository.dart';
import '../core/event_bus.dart';
import '../mappers/todo_mapper.dart';
import '../network/http_service.dart';
import '../network/network_info_service.dart';

@Injectable(as: ITodoRepository)
class TodoRepository implements ITodoRepository {
  const TodoRepository(this._httpService, this._networkInfoService, this._eventBus);

  final HttpService _httpService;
  final NetworkInfoService _networkInfoService;
  final EventBus _eventBus;

  @override
  Future<Either<Failure, List<Todo>>> getAll() async {
    if (!await _networkInfoService.isConnected) {
      return const Left(Failure.networkError());
    }

    try {
      final response = await _httpService.getAll();
      final todos = response.todos.map((todo) => todo.toEntity()).toList();
      return Right(todos);
    } on DioException catch (e) {
      return Left(Failure.serverError(e.message ?? 'Unknown server error'));
    } catch (e) {
      return const Left(Failure.unknownError());
    }
  }

  @override
  Future<Either<Failure, Todo>> getById(int id) async {
    if (!await _networkInfoService.isConnected) {
      return const Left(Failure.networkError());
    }

    try {
      final response = await _httpService.getById(id);
      return Right(response.toEntity());
    } on DioException catch (e) {
      return Left(Failure.serverError(e.message ?? 'Unknown server error'));
    } catch (e) {
      return const Left(Failure.unknownError());
    }
  }

  @override
  Future<Either<Failure, Todo>> create(Todo todo) async {
    if (!await _networkInfoService.isConnected) {
      return const Left(Failure.networkError());
    }

    try {
      final request = proto.CreateTodoRequest()
        ..title = todo.title
        ..description = todo.description;

      final response = await _httpService.create(request);
      final createdTodo = response.toEntity();
      _eventBus.emit(TodoCreatedEvent(createdTodo));
      return Right(createdTodo);
    } on DioException catch (e) {
      return Left(Failure.serverError(e.message ?? 'Unknown server error'));
    } catch (e) {
      return const Left(Failure.unknownError());
    }
  }

  @override
  Future<Either<Failure, Todo>> update(Todo todo) async {
    if (!await _networkInfoService.isConnected) {
      return const Left(Failure.networkError());
    }

    try {
      final request = proto.UpdateTodoRequest()
        ..id = todo.id ?? 0
        ..title = todo.title
        ..description = todo.description
        ..isCompleted = todo.isCompleted;

      final response = await _httpService.update(request);
      final updatedTodo = response.toEntity();
      _eventBus.emit(TodoUpdatedEvent(updatedTodo));
      return Right(updatedTodo);
    } on DioException catch (e) {
      return Left(Failure.serverError(e.message ?? 'Unknown server error'));
    } catch (e) {
      return const Left(Failure.unknownError());
    }
  }

  @override
  Future<Either<Failure, Unit>> delete(int id) async {
    if (!await _networkInfoService.isConnected) {
      return const Left(Failure.networkError());
    }

    try {
      await _httpService.delete(id);
      _eventBus.emit(TodoDeletedEvent(id));
      return const Right(unit);
    } on DioException catch (e) {
      return Left(Failure.serverError(e.message ?? 'Unknown server error'));
    } catch (e) {
      return const Left(Failure.unknownError());
    }
  }
}
