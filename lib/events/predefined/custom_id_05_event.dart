import 'package:affise_attribution_lib/events/native_event.dart';

/// Event CustomId05
///
/// @property custom the describing the meaning of the event.
/// @property timeStampMillis the timestamp event in milliseconds.
/// @property userData any custom string data.
class CustomId05Event extends NativeEvent {
  String custom;
  int timeStampMillis;
  String? userData;

  CustomId05Event({
    required this.custom,
    required this.timeStampMillis,
    this.userData,
  });

  /// Serialize CustomId05Event to Map
  ///
  /// @return Map of CustomId05Event
  @override
  dynamic serialize() {
    return <String, dynamic>{
      "affise_event_custom_id_05": custom,
      "affise_event_custom_id_05_timestamp": timeStampMillis,
    };
  }

  /// Name of event
  ///
  /// @return name
  @override
  String getName() => "CustomId05";

  /// User data
  ///
  /// @return userData
  @override
  String? getUserData() => userData;
}
