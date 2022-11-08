import 'package:affise_attribution_lib/events/native_event.dart';

/// Event CustomId08
///
/// @property custom the describing the meaning of the event.
/// @property timeStampMillis the timestamp event in milliseconds.
/// @property userData any custom string data.
class CustomId08Event extends NativeEvent {
  String custom;
  int timeStampMillis;
  String? userData;

  CustomId08Event({
    required this.custom,
    required this.timeStampMillis,
    this.userData,
  });

  /// Serialize CustomId08Event to Map
  ///
  /// @return Map of CustomId08Event
  @override
  dynamic serialize() {
    return <String, dynamic>{
      "affise_event_custom_id_08": custom,
      "affise_event_custom_id_08_timestamp": timeStampMillis,
    };
  }

  /// Name of event
  ///
  /// @return name
  @override
  String getName() => "CustomId08";

  /// User data
  ///
  /// @return userData
  @override
  String? getUserData() => userData;
}
