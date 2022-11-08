import 'package:affise_attribution_lib/events/native_event.dart';

/// Event StartRegistration
///
/// @property registration the JSON Object describing the meaning of the event.
/// @property timeStampMillis the timestamp event in milliseconds.
/// @property userData any custom string data.
class StartRegistrationEvent extends NativeEvent {
  Map<String, dynamic> registration;
  int timeStampMillis;
  String? userData;

  StartRegistrationEvent({
    required this.registration,
    required this.timeStampMillis,
    this.userData,
  });

  /// Serialize StartRegistrationEvent to Map
  ///
  /// @return Map of StartRegistrationEvent
  @override
  dynamic serialize() {
    return <String, dynamic>{
      "affise_event_start_registration": registration,
      "affise_event_start_registration_timestamp": timeStampMillis,
    };
  }

  /// Name of event
  ///
  /// @return name
  @override
  String getName() => "StartRegistration";

  /// User data
  ///
  /// @return userData
  @override
  String? getUserData() => userData;
}
