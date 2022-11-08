import 'package:affise_attribution_lib/events/native_event.dart';

/// Event CompleteStream
///
/// @property stream the JSON Object describing the meaning of the event.
/// @property timeStampMillis the timestamp event in milliseconds.
/// @property userData any custom string data.
class CompleteStreamEvent extends NativeEvent {
  Map<String, dynamic> stream;
  int timeStampMillis;
  String? userData;

  CompleteStreamEvent({
    required this.stream,
    required this.timeStampMillis,
    this.userData,
  });

  /// Serialize CompleteStreamEvent to Map
  ///
  /// @return Map of CompleteStreamEvent
  @override
  dynamic serialize() {
    return <String, dynamic>{
      "affise_event_complete_stream": stream,
      "affise_event_complete_stream_timestamp": timeStampMillis,
    };
  }

  /// Name of event
  ///
  /// @return name
  @override
  String getName() => "CompleteStream";

  /// User data
  ///
  /// @return userData
  @override
  String? getUserData() => userData;
}
