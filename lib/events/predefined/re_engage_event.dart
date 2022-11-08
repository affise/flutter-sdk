import 'package:affise_attribution_lib/events/native_event.dart';

/// Event Rate use
///
/// @property reEngage the describing the meaning of the event.
/// @property userData any custom string data.
class ReEngageEvent extends NativeEvent {
  String reEngage;
  String? userData;

  ReEngageEvent({
    required this.reEngage,
    this.userData,
  });

  /// Serialize ReEngageEvent to Map
  ///
  /// @return Map of ReEngageEvent
  @override
  dynamic serialize() {
    return <String, dynamic>{
      "affise_event_re_engage": reEngage,
    };
  }

  /// Name of event
  ///
  /// @return name
  @override
  String getName() => "ReEngage";

  /// User data
  ///
  /// @return userData
  @override
  String? getUserData() => userData;
}
