import 'package:affise_attribution_lib/events/native_event.dart';

/// Event CustomId10
///
/// @property custom the describing the meaning of the event.
/// @property timeStampMillis the timestamp event in milliseconds.
/// @property userData any custom string data.
class CustomId10Event extends NativeEvent {
  String custom;
  int timeStampMillis;
  String? userData;

  CustomId10Event({
    required this.custom,
    required this.timeStampMillis,
    this.userData,
  });

  /// Serialize CustomId10Event to Map
  ///
  /// @return Map of CustomId10Event
  @override
  dynamic serialize() {
    return <String, dynamic>{
      "affise_event_custom_id_10": custom,
      "affise_event_custom_id_10_timestamp": timeStampMillis,
    };
  }

  /// Name of event
  ///
  /// @return name
  @override
  String getName() => "CustomId10";

  /// User data
  ///
  /// @return userData
  @override
  String? getUserData() => userData;
}
