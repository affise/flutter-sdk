import 'package:affise_attribution_lib/events/native_event.dart';

/// Event CustomId07
///
/// @property custom the describing the meaning of the event.
/// @property timeStampMillis the timestamp event in milliseconds.
/// @property userData any custom string data.
class CustomId07Event extends NativeEvent {
  String custom;
  int timeStampMillis;
  String? userData;

  CustomId07Event({
    required this.custom,
    required this.timeStampMillis,
    this.userData,
  });

  /// Serialize CustomId07Event to Map
  ///
  /// @return Map of CustomId07Event
  @override
  dynamic serialize() {
    return <String, dynamic>{
      "affise_event_custom_id_07": custom,
      "affise_event_custom_id_07_timestamp": timeStampMillis,
    };
  }

  /// Name of event
  ///
  /// @return name
  @override
  String getName() => "CustomId07";

  /// User data
  ///
  /// @return userData
  @override
  String? getUserData() => userData;
}
