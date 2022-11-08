import 'package:affise_attribution_lib/events/native_event.dart';

/// Event StartTutorial
///
/// @property tutorial the JSON Object describing the meaning of the event.
/// @property timeStampMillis the timestamp event in milliseconds.
/// @property userData any custom string data.
class StartTutorialEvent extends NativeEvent {
  Map<String, dynamic> tutorial;
  int timeStampMillis;
  String? userData;

  StartTutorialEvent({
    required this.tutorial,
    required this.timeStampMillis,
    this.userData,
  });

  /// Serialize StartTutorialEvent to Map
  ///
  /// @return Map of StartTutorialEvent
  @override
  dynamic serialize() {
    return <String, dynamic>{
      "affise_event_start_tutorial": tutorial,
      "affise_event_start_tutorial_timestamp": timeStampMillis,
    };
  }

  /// Name of event
  ///
  /// @return name
  @override
  String getName() => "StartTutorial";

  /// User data
  ///
  /// @return userData
  @override
  String? getUserData() => userData;
}
