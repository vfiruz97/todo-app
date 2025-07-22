import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_proto/todo_proto.dart' as proto;

import '../../domain/entities/failure.dart';
import '../../domain/entities/todo.dart';
import '../../domain/repositories/i_todo_repository.dart';
import '../mappers/todo_mapper.dart';
import '../network/http_service.dart';

@Injectable(as: ITodoRepository)
class TodoRepository implements ITodoRepository {
  const TodoRepository(this._httpService);

  final HttpService _httpService;

  @override
  Future<Either<Failure, List<Todo>>> getAll() async {
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
    try {
      final request = proto.CreateTodoRequest()
        ..title = todo.title
        ..description = todo.description;

      final response = await _httpService.create(request);
      return Right(response.toEntity());
    } on DioException catch (e) {
      return Left(Failure.serverError(e.message ?? 'Unknown server error'));
    } catch (e) {
      return const Left(Failure.unknownError());
    }
  }

  @override
  Future<Either<Failure, Todo>> update(Todo todo) async {
    try {
      final request = proto.UpdateTodoRequest()
        ..id = todo.id ?? 0
        ..title = todo.title
        ..description = todo.description
        ..isCompleted = todo.isCompleted;

      final response = await _httpService.update(request);
      return Right(response.toEntity());
    } on DioException catch (e) {
      return Left(Failure.serverError(e.message ?? 'Unknown server error'));
    } catch (e) {
      return const Left(Failure.unknownError());
    }
  }

  @override
  Future<Either<Failure, Unit>> delete(int id) async {
    try {
      await _httpService.delete(id);
      return const Right(unit);
    } on DioException catch (e) {
      return Left(Failure.serverError(e.message ?? 'Unknown server error'));
    } catch (e) {
      return const Left(Failure.unknownError());
    }
  }
}
