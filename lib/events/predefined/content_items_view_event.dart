import 'package:affise_attribution_lib/events/native_event.dart';

/// Event ContentItemsView
///
/// @property objects the list of JSON Object describing the meaning of the event.
/// @property userData any custom string data.
class ContentItemsViewEvent extends NativeEvent {
  List<dynamic> objects;
  String? userData;

  ContentItemsViewEvent({
    required this.objects,
    this.userData,
  });

  /// Serialize ContentItemsViewEvent to Map
  ///
  /// @return Map of ContentItemsViewEvent
  @override
  dynamic serialize() {
    return <String, dynamic>{
      "affise_event_content_items_view": objects,
    };
  }

  /// Name of event
  ///
  /// @return name
  @override
  String getName() => "ContentItemsView";

  /// User data
  ///
  /// @return userData
  @override
  String? getUserData() => userData;
}
