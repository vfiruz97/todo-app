abstract class DomainEvent {
  DomainEvent() : occurredOn = DateTime.now();
  final DateTime occurredOn;
}
