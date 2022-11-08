import 'package:affise_attribution_lib/events/native_event.dart';

/// Event Login
///
/// @property login the JSON Object describing the meaning of the event.
/// @property timeStampMillis the timestamp event in milliseconds.
/// @property userData any custom string data.
class LoginEvent extends NativeEvent {
  Map<String, dynamic> login;
  int timeStampMillis;
  String? userData;

  LoginEvent({
    required this.login,
    required this.timeStampMillis,
    this.userData,
  });

  /// Serialize LoginEvent to Map
  ///
  /// @return Map of LoginEvent
  @override
  dynamic serialize() {
    return <String, dynamic>{
      "affise_event_login": login,
      "affise_event_login_timestamp": timeStampMillis,
    };
  }

  /// Name of event
  ///
  /// @return name
  @override
  String getName() => "Login";

  /// User data
  ///
  /// @return userData
  @override
  String? getUserData() => userData;
}
