import 'package:affise_attribution_lib/events/native_event.dart';

/// Event Share
///
/// @property share the JSON Object describing the meaning of the event.
/// @property timeStampMillis the timestamp event in milliseconds.
/// @property userData any custom string data.
class ShareEvent extends NativeEvent {
  Map<String, dynamic> share;
  int timeStampMillis;
  String? userData;

  ShareEvent({
    required this.share,
    required this.timeStampMillis,
    this.userData,
  });

  /// Serialize ShareEvent to Map
  ///
  /// @return Map of ShareEvent
  @override
  dynamic serialize() {
    return <String, dynamic>{
      "affise_event_share": share,
      "affise_event_share_timestamp": timeStampMillis,
    };
  }

  /// Name of event
  ///
  /// @return name
  @override
  String getName() => "Share";

  /// User data
  ///
  /// @return userData
  @override
  String? getUserData() => userData;
}
