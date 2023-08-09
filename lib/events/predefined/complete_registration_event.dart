
import 'package:affise_attribution_lib/events/native_event.dart';

import '../event_name.dart';

/// Event CompleteRegistration
///
/// @property userData any custom string data.
/// @property timeStampMillis the timestamp event in milliseconds.
class CompleteRegistrationEvent extends NativeEvent {

  CompleteRegistrationEvent({
    super.userData,
    super.timeStampMillis,
  });

  /// Name of event
  ///
  /// @return name
  @override
  String getName() => EventName.COMPLETE_REGISTRATION.eventName;
}