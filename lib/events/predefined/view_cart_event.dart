import 'package:affise_attribution_lib/events/native_event.dart';

/// Event ViewCart
///
/// @property objects the JSON Object describing the meaning of the event.
/// @property userData any custom string data.
class ViewCartEvent extends NativeEvent {
  Map<String, dynamic> objects;
  String? userData;

  ViewCartEvent({
    required this.objects,
    this.userData,
  });

  /// Serialize ViewCartEvent to Map
  ///
  /// @return Map of ViewCartEvent
  @override
  dynamic serialize() {
    return <String, dynamic>{
      "affise_event_view_cart": objects,
    };
  }

  /// Name of event
  ///
  /// @return name
  @override
  String getName() => "ViewCart";

  /// User data
  ///
  /// @return userData
  @override
  String? getUserData() => userData;
}
