import 'package:affise_attribution_lib/events/native_event.dart';

import '../event_name.dart';

/// When a user has some achieve level event.
///
/// @property userData any custom string data.
/// @property timeStampMillis the timestamp event in milliseconds.
class AchieveLevelEvent extends NativeEvent {
  AchieveLevelEvent({
    super.userData,
    super.timeStampMillis,
  });

  /// Name of event
  ///
  /// @return name
  @override
  String getName() => EventName.ACHIEVE_LEVEL.eventName;
}
