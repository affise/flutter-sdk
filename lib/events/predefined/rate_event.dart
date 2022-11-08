import 'package:affise_attribution_lib/events/native_event.dart';

/// Event Rate use
///
/// @property rate the JSON Object describing the meaning of the event.
/// @property timeStampMillis the timestamp event in milliseconds.
/// @property userData any custom string data.
class RateEvent extends NativeEvent {
  Map<String, dynamic> rate;
  int timeStampMillis;
  String? userData;

  RateEvent({
    required this.rate,
    required this.timeStampMillis,
    this.userData,
  });

  /// Serialize RateEvent to Map
  ///
  /// @return Map of RateEvent
  @override
  dynamic serialize() {
    return <String, dynamic>{
      "affise_event_rate": rate,
      "affise_event_rate_timestamp": timeStampMillis,
    };
  }

  /// Name of event
  ///
  /// @return name
  @override
  String getName() => "Rate";

  /// User data
  ///
  /// @return userData
  @override
  String? getUserData() => userData;
}
