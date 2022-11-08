import 'package:affise_attribution_lib/events/native_event.dart';

/// Event CompleteTutorial
///
/// @property tutorial the JSON Object describing the meaning of the event.
/// @property timeStampMillis the timestamp event in milliseconds.
/// @property userData any custom string data.
class CompleteTutorialEvent extends NativeEvent {
  Map<String, dynamic> tutorial;
  int timeStampMillis;
  String? userData;

  CompleteTutorialEvent({
    required this.tutorial,
    required this.timeStampMillis,
    this.userData,
  });

  /// Serialize CompleteTutorialEvent to Map
  ///
  /// @return Map of CompleteTutorialEvent
  @override
  dynamic serialize() {
    return <String, dynamic>{
      "affise_event_complete_tutorial": tutorial,
      "affise_event_complete_tutorial_timestamp": timeStampMillis,
    };
  }

  /// Name of event
  ///
  /// @return name
  @override
  String getName() => "CompleteTutorial";

  /// User data
  ///
  /// @return userData
  @override
  String? getUserData() => userData;
}
