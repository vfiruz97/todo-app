import 'package:todo_proto/todo_proto.dart' as proto;
import 'package:fixnum/fixnum.dart';
import '../../domain/entities/todo.dart';

extension TodoMapper on Todo {
  proto.Todo toProto() {
    return proto.Todo()
      ..id = id ?? 0
      ..title = title
      ..description = description
      ..isCompleted = isCompleted
      ..createdAt = Int64(createdAt.millisecondsSinceEpoch)
      ..updatedAt = Int64(updatedAt.millisecondsSinceEpoch);
  }
}

extension TodoProtoMapper on proto.Todo {
  Todo toEntity() {
    return Todo(
      id: id == 0 ? null : id,
      title: title,
      description: description,
      isCompleted: isCompleted,
      createdAt: DateTime.fromMillisecondsSinceEpoch(createdAt.toInt()),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(updatedAt.toInt()),
    );
  }
}
