
import 'package:affise_attribution_lib/events/native_event.dart';

/// Event ViewAdv
///
/// @property ad the JSON Object describing the meaning of the event.
/// @property timeStampMillis the timestamp event in milliseconds.
/// @property userData any custom string data.
class ViewAdvEvent extends NativeEvent {
  Map<String, dynamic> ad;
  int timeStampMillis;
  String? userData;

  ViewAdvEvent({
    required this.ad,
    required this.timeStampMillis,
    this.userData,
  });

  /// Serialize ViewAdvEvent to Map
  ///
  /// @return Map of ViewAdvEvent
  @override
  dynamic serialize() {
    return <String, dynamic>{
      "affise_event_view_adv": ad,
      "affise_event_view_adv_timestamp": timeStampMillis,
    };
  }

  /// Name of event
  ///
  /// @return name
  @override
  String getName() => "ViewAdv";

  /// User data
  ///
  /// @return userData
  @override
  String? getUserData() => userData;
}