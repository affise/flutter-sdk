import 'package:affise_attribution_lib/events/native_event.dart';

/// Event OpenedFromPushNotification
///
/// @property details the describing the meaning of the event.
/// @property userData any custom string data.
class OpenedFromPushNotificationEvent extends NativeEvent {
  String details;
  String? userData;

  OpenedFromPushNotificationEvent({
    required this.details,
    this.userData,
  });

  /// Serialize OpenedFromPushNotificationEvent to Map
  ///
  /// @return Map of OpenedFromPushNotificationEvent
  @override
  dynamic serialize() {
    return <String, dynamic>{
      "affise_event_opened_from_push_notification": details,
    };
  }

  /// Name of event
  ///
  /// @return name
  @override
  String getName() => "OpenedFromPushNotification";

  /// User data
  ///
  /// @return userData
  @override
  String? getUserData() => userData;
}
