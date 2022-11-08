import 'package:affise_attribution_lib/events/native_event.dart';

/// Event CustomId04
///
/// @property custom the describing the meaning of the event.
/// @property timeStampMillis the timestamp event in milliseconds.
/// @property userData any custom string data.
class CustomId04Event extends NativeEvent {
  String custom;
  int timeStampMillis;
  String? userData;

  CustomId04Event({
    required this.custom,
    required this.timeStampMillis,
    this.userData,
  });

  /// Serialize CustomId04Event to Map
  ///
  /// @return Map of CustomId04Event
  @override
  dynamic serialize() {
    return <String, dynamic>{
      "affise_event_custom_id_04": custom,
      "affise_event_custom_id_04_timestamp": timeStampMillis,
    };
  }

  /// Name of event
  ///
  /// @return name
  @override
  String getName() => "CustomId04";

  /// User data
  ///
  /// @return userData
  @override
  String? getUserData() => userData;
}
