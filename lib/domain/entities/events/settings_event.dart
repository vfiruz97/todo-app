import '../../core/events/domain_event.dart';
import '../settings.dart';

class SettingsUpdateEvent extends DomainEvent {
  SettingsUpdateEvent(this.settings);
  final Settings settings;
}
