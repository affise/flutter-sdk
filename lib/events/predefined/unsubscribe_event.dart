import 'package:affise_attribution_lib/events/native_event.dart';

/// Event Unsubscribe
///
/// @property unsubscribe the JSON Object describing the meaning of the event.
/// @property timeStampMillis the timestamp event in milliseconds.
/// @property userData any custom string data.
class UnsubscribeEvent extends NativeEvent {
  Map<String, dynamic> unsubscribe;
  int timeStampMillis;
  String? userData;

  UnsubscribeEvent({
    required this.unsubscribe,
    required this.timeStampMillis,
    this.userData,
  });

  /// Serialize UnsubscribeEvent to Map
  ///
  /// @return Map of UnsubscribeEvent
  @override
  dynamic serialize() {
    return <String, dynamic>{
      "affise_event_unsubscribe": unsubscribe,
      "affise_event_unsubscribe_timestamp": timeStampMillis,
    };
  }

  /// Name of event
  ///
  /// @return name
  @override
  String getName() => "Unsubscribe";

  /// User data
  ///
  /// @return userData
  @override
  String? getUserData() => userData;
}