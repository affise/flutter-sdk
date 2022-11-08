import 'package:affise_attribution_lib/events/native_event.dart';

/// Event CustomId01
///
/// @property custom the describing the meaning of the event.
/// @property timeStampMillis the timestamp event in milliseconds.
/// @property userData any custom string data.
class CustomId01Event extends NativeEvent {
  String custom;
  int timeStampMillis;
  String? userData;

  CustomId01Event({
    required this.custom,
    required this.timeStampMillis,
    this.userData,
  });

  /// Serialize CustomId01Event to Map
  ///
  /// @return Map of CustomId01Event
  @override
  dynamic serialize() {
    return <String, dynamic>{
      "affise_event_custom_id_01": custom,
      "affise_event_custom_id_01_timestamp": timeStampMillis,
    };
  }

  /// Name of event
  ///
  /// @return name
  @override
  String getName() => "CustomId01";

  /// User data
  ///
  /// @return userData
  @override
  String? getUserData() => userData;
}
