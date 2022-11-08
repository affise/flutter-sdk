import 'package:affise_attribution_lib/events/native_event.dart';

/// Event Invite
///
/// @property invite the JSON Object describing the meaning of the event.
/// @property timeStampMillis the timestamp event in milliseconds.
/// @property userData any custom string data.
class InviteEvent extends NativeEvent {
  Map<String, dynamic> invite;
  int timeStampMillis;
  String? userData;

  InviteEvent({
    required this.invite,
    required this.timeStampMillis,
    this.userData,
  });

  /// Serialize InviteEvent to Map
  ///
  /// @return Map of InviteEvent
  @override
  dynamic serialize() {
    return <String, dynamic>{
      "affise_event_invite": invite,
      "affise_event_invite_timestamp": timeStampMillis,
    };
  }

  /// Name of event
  ///
  /// @return name
  @override
  String getName() => "Invite";

  /// User data
  ///
  /// @return userData
  @override
  String? getUserData() => userData;
}
