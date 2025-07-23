import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_proto/todo_proto.dart' as proto;

import 'network_module.dart';

@injectable
class HttpService {
  HttpService(this._dioFactory);

  final DioFactory _dioFactory;

  Dio get _dio => _dioFactory.dio;

  Future<proto.ListTodosResponse> getAll() async {
    final response = await _dio.get('/tasks');
    return proto.ListTodosResponse.fromBuffer(response.data);
  }

  Future<proto.Todo> getById(int id) async {
    final response = await _dio.get('/tasks/$id');
    return proto.Todo.fromBuffer(response.data);
  }

  Future<proto.Todo> create(proto.CreateTodoRequest request) async {
    final response = await _dio.post('/tasks', data: request.writeToBuffer());
    return proto.Todo.fromBuffer(response.data);
  }

  Future<proto.Todo> update(proto.UpdateTodoRequest request) async {
    final response = await _dio.put('/tasks/${request.id}', data: request.writeToBuffer());
    return proto.Todo.fromBuffer(response.data);
  }

  Future<void> delete(int id) async {
    await _dio.delete('/tasks/$id');
  }
}
