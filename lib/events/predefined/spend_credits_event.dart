import 'package:affise_attribution_lib/events/native_event.dart';

/// Event SpendCredits
///
/// @property credits the value of the event.
/// @property timeStampMillis the timestamp event in milliseconds.
/// @property userData any custom string data.
class SpendCreditsEvent extends NativeEvent {
  int credits;
  int timeStampMillis;
  String? userData;

  SpendCreditsEvent({
    required this.credits,
    required this.timeStampMillis,
    this.userData,
  });

  /// Serialize SpendCreditsEvent to Map
  ///
  /// @return Map of SpendCreditsEvent
  @override
  dynamic serialize() {
    return <String, dynamic>{
      "affise_event_spend_credits": credits,
      "affise_event_spend_credits_timestamp": timeStampMillis,
    };
  }

  /// Name of event
  ///
  /// @return name
  @override
  String getName() => "SpendCredits";

  /// User data
  ///
  /// @return userData
  @override
  String? getUserData() => userData;
}
