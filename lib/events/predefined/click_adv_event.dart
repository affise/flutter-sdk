import 'package:affise_attribution_lib/events/native_event.dart';

/// Event ClickAdv
///
/// @property advertisement the describing the meaning of the event.
/// @property timeStampMillis the timestamp event in milliseconds.
/// @property userData any custom string data.
class ClickAdvEvent extends NativeEvent {
  String advertisement;
  int timeStampMillis;
  String? userData;

  ClickAdvEvent({
    required this.advertisement,
    required this.timeStampMillis,
    this.userData,
  });

  /// Serialize ClickAdvEvent to Map
  ///
  /// @return Map of ClickAdvEvent
  @override
  dynamic serialize() {
    return <String, dynamic>{
      "affise_event_click_adv": advertisement,
      "affise_event_click_adv_timestamp": timeStampMillis,
    };
  }

  /// Name of event
  ///
  /// @return name
  @override
  String getName() => "ClickAdv";

  /// User data
  ///
  /// @return userData
  @override
  String? getUserData() => userData;
}
