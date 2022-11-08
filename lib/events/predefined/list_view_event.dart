import 'package:affise_attribution_lib/events/native_event.dart';

/// Event ListView
///
/// @property list the JSON Object describing the meaning of the event.
/// @property userData any custom string data.
class ListViewEvent extends NativeEvent {
  Map<String, dynamic> list;
  String? userData;

  ListViewEvent({
    required this.list,
    this.userData,
  });

  /// Serialize ListViewEvent to Map
  ///
  /// @return Map of ListViewEvent
  @override
  dynamic serialize() {
    return <String, dynamic>{
      "affise_event_list_view": list,
    };
  }

  /// Name of event
  ///
  /// @return name
  @override
  String getName() => "ListView";

  /// User data
  ///
  /// @return userData
  @override
  String? getUserData() => userData;
}
