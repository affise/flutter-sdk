import 'package:affise_attribution_lib/events/native_event.dart';

import 'touch_type.dart';

/// Event LastAttributedTouch
///
/// @property touchType type in CLICK, WEB_TO_APP_AUTO_REDIRECT, IMPRESSION
/// @property timeStampMillis the timestamp event in milliseconds.
/// @property touchData the JSON Object describing the meaning of the event.
/// @property userData any custom string data.
class LastAttributedTouchEvent extends NativeEvent {
  TouchType touchType;
  int timeStampMillis;
  Map<String, dynamic> touchData;
  String? userData;

  LastAttributedTouchEvent({
    required this.touchType,
    required this.timeStampMillis,
    required this.touchData,
    this.userData,
  });

  /// Serialize LastAttributedTouchEvent to Map
  ///
  /// @return Map of LastAttributedTouchEvent
  @override
  dynamic serialize() {
    return <String, dynamic>{
      "affise_event_last_attributed_touch_type": touchType.value,
      "affise_event_last_attributed_touch_timestamp": timeStampMillis,
      "affise_event_last_attributed_touch_data": touchData,
    };
  }

  /// Name of event
  ///
  /// @return name
  @override
  String getName() => "LastAttributedTouch";

  /// User data
  ///
  /// @return userData
  @override
  String? getUserData() => userData;
}
