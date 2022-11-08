
import 'package:affise_attribution_lib/events/native_event.dart';

/// Event Update
///
/// @property details the JSON array describing the meaning of the event.
/// @property userData any custom string data.
class UpdateEvent extends NativeEvent {
  List<dynamic> details;
  String? userData;

  UpdateEvent({
    required this.details,
    this.userData,
  });

  /// Serialize UpdateEvent to Map
  ///
  /// @return Map of UpdateEvent
  @override
  dynamic serialize() {
    return <String, dynamic>{
      "affise_event_update": details,
    };
  }

  /// Name of event
  ///
  /// @return name
  @override
  String getName() => "Update";

  /// User data
  ///
  /// @return userData
  @override
  String? getUserData() => userData;
}
