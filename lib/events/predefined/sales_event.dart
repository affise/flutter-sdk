import '../native_event.dart';
import '../event_name.dart';

/// Event Sales
///
/// @property userData any custom string data.
/// @property timeStampMillis the timestamp event in milliseconds.
class SalesEvent extends NativeEvent {

  SalesEvent({
    super.userData,
    super.timeStampMillis,
  });

  /// Name of event
  ///
  /// @return name
  @override
  String getName() => EventName.SALES.eventName;
}
