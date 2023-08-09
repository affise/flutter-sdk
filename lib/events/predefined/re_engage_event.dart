import 'package:affise_attribution_lib/events/native_event.dart';

import '../event_name.dart';

/// Event Rate use
///
/// @property userData any custom string data.
/// @property timeStampMillis the timestamp event in milliseconds.
class ReEngageEvent extends NativeEvent {

  ReEngageEvent({
    super.userData,
    super.timeStampMillis,
  });

  /// Name of event
  ///
  /// @return name
  @override
  String getName() => EventName.RE_ENGAGE.eventName;
}
