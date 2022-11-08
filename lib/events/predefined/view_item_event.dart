import 'package:affise_attribution_lib/events/native_event.dart';

/// Event ViewItem
///
/// @property item the JSON Object describing the meaning of the event.
/// @property userData any custom string data.
class ViewItemEvent  extends NativeEvent {
  Map<String, dynamic> item;
  String? userData;

  ViewItemEvent({
    required this.item,
    this.userData,
  });

  /// Serialize ViewItemEvent to Map
  ///
  /// @return Map of ViewItemEvent
  @override
  dynamic serialize() {
    return <String, dynamic>{
      "affise_event_view_item": item,
    };
  }

  /// Name of event
  ///
  /// @return name
  @override
  String getName() => "ViewItem";

  /// User data
  ///
  /// @return userData
  @override
  String? getUserData() => userData;
}