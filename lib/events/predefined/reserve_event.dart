import 'package:affise_attribution_lib/events/native_event.dart';

/// Event Reserve
///
/// @property reserve the list of JSON Object describing the meaning of the event.
/// @property timeStampMillis the timestamp event in milliseconds.
/// @property userData any custom string data.
class ReserveEvent extends NativeEvent {
  List<dynamic> reserve;
  int timeStampMillis;
  String? userData;

  ReserveEvent({
    required this.reserve,
    required this.timeStampMillis,
    this.userData,
  });

  /// Serialize ReserveEvent to Map
  ///
  /// @return Map of ReserveEvent
  @override
  dynamic serialize() {
    return <String, dynamic>{
      "affise_event_reserve": reserve,
      "affise_event_reserve_timestamp": timeStampMillis,
    };
  }

  /// Name of event
  ///
  /// @return name
  @override
  String getName() => "Reserve";

  /// User data
  ///
  /// @return userData
  @override
  String? getUserData() => userData;
}
