import 'package:affise_attribution_lib/events/native_event.dart';

/// Event CustomId02
///
/// @property custom the describing the meaning of the event.
/// @property timeStampMillis the timestamp event in milliseconds.
/// @property userData any custom string data.
class CustomId02Event extends NativeEvent {
  String custom;
  int timeStampMillis;
  String? userData;

  CustomId02Event({
    required this.custom,
    required this.timeStampMillis,
    this.userData,
  });

  /// Serialize CustomId02Event to Map
  ///
  /// @return Map of CustomId02Event
  @override
  dynamic serialize() {
    return <String, dynamic>{
      "affise_event_custom_id_02": custom,
      "affise_event_custom_id_02_timestamp": timeStampMillis,
    };
  }

  /// Name of event
  ///
  /// @return name
  @override
  String getName() => "CustomId02";

  /// User data
  ///
  /// @return userData
  @override
  String? getUserData() => userData;
}
