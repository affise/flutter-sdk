import 'package:affise_attribution_lib/events/native_event.dart';

/// Event Subscribe
///
/// @property subscribe the JSON Object describing the meaning of the event.
/// @property timeStampMillis the timestamp event in milliseconds.
/// @property userData any custom string data.
class SubscribeEvent extends NativeEvent {
  Map<String, dynamic> subscribe;
  int timeStampMillis;
  String? userData;

  SubscribeEvent({
    required this.subscribe,
    required this.timeStampMillis,
    this.userData,
  });

  /// Serialize SubscribeEvent to Map
  ///
  /// @return Map of SubscribeEvent
  @override
  dynamic serialize() {
    return <String, dynamic>{
      "affise_event_subscribe": subscribe,
      "affise_event_subscribe_timestamp": timeStampMillis,
    };
  }

  /// Name of event
  ///
  /// @return name
  @override
  String getName() => "Subscribe";

  /// User data
  ///
  /// @return userData
  @override
  String? getUserData() => userData;
}
