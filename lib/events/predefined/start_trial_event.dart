import 'package:affise_attribution_lib/events/native_event.dart';

/// Event StartTrial
///
/// @property trial the JSON Object describing the meaning of the event.
/// @property timeStampMillis the timestamp event in milliseconds.
/// @property userData any custom string data.
class StartTrialEvent extends NativeEvent {
  Map<String, dynamic> trial;
  int timeStampMillis;
  String? userData;

  StartTrialEvent({
    required this.trial,
    required this.timeStampMillis,
    this.userData,
  });

  /// Serialize StartTrialEvent to Map
  ///
  /// @return Map of StartTrialEvent
  @override
  dynamic serialize() {
    return <String, dynamic>{
      "affise_event_start_trial": trial,
      "affise_event_start_trial_timestamp": timeStampMillis,
    };
  }

  /// Name of event
  ///
  /// @return name
  @override
  String getName() => "StartTrial";

  /// User data
  ///
  /// @return userData
  @override
  String? getUserData() => userData;
}
