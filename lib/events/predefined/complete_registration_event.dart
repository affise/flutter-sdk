
import 'package:affise_attribution_lib/events/native_event.dart';

/// Event CompleteRegistration
///
/// @property registration the JSON Object describing the meaning of the event.
/// @property timeStampMillis the timestamp event in milliseconds.
/// @property userData any custom string data.
class CompleteRegistrationEvent extends NativeEvent {
  Map<String, dynamic> registration;
  int timeStampMillis;
  String? userData;

  CompleteRegistrationEvent({
    required this.registration,
    required this.timeStampMillis,
    this.userData,
  });

  /// Serialize CompleteRegistrationEvent to Map
  ///
  /// @return Map of CompleteRegistrationEvent
  @override
  dynamic serialize() {
    return <String, dynamic>{
      "affise_event_complete_registration": registration,
      "affise_event_complete_registration_timestamp": timeStampMillis,
    };
  }

  /// Name of event
  ///
  /// @return name
  @override
  String getName() => "CompleteRegistration";

  /// User data
  ///
  /// @return userData
  @override
  String? getUserData() => userData;
}