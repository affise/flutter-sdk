import 'package:affise_attribution_lib/events/native_event.dart';

/// Event CompleteTrial
///
/// @property trial the JSON Object describing the meaning of the event.
/// @property timeStampMillis the timestamp event in milliseconds.
/// @property userData any custom string data.
class CompleteTrialEvent extends NativeEvent {
  Map<String, dynamic> trial;
  int timeStampMillis;
  String? userData;

  CompleteTrialEvent({
    required this.trial,
    required this.timeStampMillis,
    this.userData,
  });

  /// Serialize CompleteTrialEvent to Map
  ///
  /// @return Map of CompleteTrialEvent
  @override
  dynamic serialize() {
    return <String, dynamic>{
      "affise_event_complete_trial": trial,
      "affise_event_complete_trial_timestamp": timeStampMillis,
    };
  }

  /// Name of event
  ///
  /// @return name
  @override
  String getName() => "CompleteTrial";

  /// User data
  ///
  /// @return userData
  @override
  String? getUserData() => userData;
}
