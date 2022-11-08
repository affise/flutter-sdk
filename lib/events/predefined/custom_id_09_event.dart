import 'package:affise_attribution_lib/events/native_event.dart';

/// Event CustomId09
///
/// @property custom the describing the meaning of the event.
/// @property timeStampMillis the timestamp event in milliseconds.
/// @property userData any custom string data.
class CustomId09Event extends NativeEvent {
  String custom;
  int timeStampMillis;
  String? userData;

  CustomId09Event({
    required this.custom,
    required this.timeStampMillis,
    this.userData,
  });

  /// Serialize CustomId09Event to Map
  ///
  /// @return Map of CustomId09Event
  @override
  dynamic serialize() {
    return <String, dynamic>{
      "affise_event_custom_id_09": custom,
      "affise_event_custom_id_09_timestamp": timeStampMillis,
    };
  }

  /// Name of event
  ///
  /// @return name
  @override
  String getName() => "CustomId09";

  /// User data
  ///
  /// @return userData
  @override
  String? getUserData() => userData;
}
