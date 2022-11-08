import 'package:affise_attribution_lib/events/native_event.dart';

/// Event CustomId06
///
/// @property custom the describing the meaning of the event.
/// @property timeStampMillis the timestamp event in milliseconds.
/// @property userData any custom string data.
class CustomId06Event extends NativeEvent {
  String custom;
  int timeStampMillis;
  String? userData;

  CustomId06Event({
    required this.custom,
    required this.timeStampMillis,
    this.userData,
  });

  /// Serialize CustomId06Event to Map
  ///
  /// @return Map of CustomId06Event
  @override
  dynamic serialize() {
    return <String, dynamic>{
      "affise_event_custom_id_06": custom,
      "affise_event_custom_id_06_timestamp": timeStampMillis,
    };
  }

  /// Name of event
  ///
  /// @return name
  @override
  String getName() => "CustomId06";

  /// User data
  ///
  /// @return userData
  @override
  String? getUserData() => userData;
}
