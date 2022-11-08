import 'package:affise_attribution_lib/events/native_event.dart';

/// Event InitiateStream
///
/// @property stream the JSON Object describing the meaning of the event.
/// @property timeStampMillis the timestamp event in milliseconds.
/// @property userData any custom string data.
class InitiateStreamEvent extends NativeEvent {
  Map<String, dynamic> stream;
  int timeStampMillis;
  String? userData;

  InitiateStreamEvent({
    required this.stream,
    required this.timeStampMillis,
    this.userData,
  });

  /// Serialize InitiateStreamEvent to Map
  ///
  /// @return Map of InitiateStreamEvent
  @override
  dynamic serialize() {
    return <String, dynamic>{
      "affise_event_initiate_stream": stream,
      "affise_event_initiate_stream_timestamp": timeStampMillis,
    };
  }

  /// Name of event
  ///
  /// @return name
  @override
  String getName() => "InitiateStream";

  /// User data
  ///
  /// @return userData
  @override
  String? getUserData() => userData;
}
