import '../../core/events/domain_event.dart';
import '../todo.dart';

class TodoCreatedEvent extends DomainEvent {
  TodoCreatedEvent(this.todo);
  final Todo todo;
}

class TodoUpdatedEvent extends DomainEvent {
  TodoUpdatedEvent(this.todo);
  final Todo todo;
}

class TodoDeletedEvent extends DomainEvent {
  TodoDeletedEvent(this.todoId);
  final int todoId;
}
