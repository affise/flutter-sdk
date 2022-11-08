import 'package:affise_attribution_lib/events/native_event.dart';

/// Event ViewItems
///
/// @property items the JSON array describing the meaning of the event.
/// @property userData any custom string data.
class ViewItemsEvent extends NativeEvent {
  List<dynamic> items;
  String? userData;

  ViewItemsEvent({
    required this.items,
    this.userData,
  });

  /// Serialize ViewItemsEvent to Map
  ///
  /// @return Map of ViewItemsEvent
  @override
  dynamic serialize() {
    return <String, dynamic>{
      "affise_event_view_items": items,
    };
  }

  /// Name of event
  ///
  /// @return name
  @override
  String getName() => "ViewItems";

  /// User data
  ///
  /// @return userData
  @override
  String? getUserData() => userData;
}
