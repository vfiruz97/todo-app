import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

import '../../domain/core/events/domain_event.dart';

@lazySingleton
class EventBus {
  final _controller = BehaviorSubject<DomainEvent>();

  Stream<DomainEvent> get events => _controller.stream;

  void emit(DomainEvent event) {
    _controller.add(event);
  }

  void dispose() {
    _controller.close();
  }
}
