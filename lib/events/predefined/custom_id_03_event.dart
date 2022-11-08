import 'package:affise_attribution_lib/events/native_event.dart';

/// Event CustomId03
///
/// @property custom the describing the meaning of the event.
/// @property timeStampMillis the timestamp event in milliseconds.
/// @property userData any custom string data.
class CustomId03Event extends NativeEvent {
  String custom;
  int timeStampMillis;
  String? userData;

  CustomId03Event({
    required this.custom,
    required this.timeStampMillis,
    this.userData,
  });

  /// Serialize CustomId03Event to Map
  ///
  /// @return Map of CustomId03Event
  @override
  dynamic serialize() {
    return <String, dynamic>{
      "affise_event_custom_id_03": custom,
      "affise_event_custom_id_03_timestamp": timeStampMillis,
    };
  }

  /// Name of event
  ///
  /// @return name
  @override
  String getName() => "CustomId03";

  /// User data
  ///
  /// @return userData
  @override
  String? getUserData() => userData;
}
