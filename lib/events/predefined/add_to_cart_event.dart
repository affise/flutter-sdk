import 'package:affise_attribution_lib/events/native_event.dart';

/// Event AddToCart
///
/// @property addToCartObject the JSON Object describing the meaning of the event.
/// @property timeStampMillis the timestamp event in milliseconds.
/// @property userData any custom string data.
class AddToCartEvent extends NativeEvent {
  Map<String, dynamic> addToCartObject;
  int timeStampMillis;
  String? userData;

  AddToCartEvent({
    required this.addToCartObject,
    required this.timeStampMillis,
    this.userData,
  });

  /// Serialize AddToCartEvent to Map
  ///
  /// @return Map of AddToCartEvent
  @override
  dynamic serialize() {
    return <String, dynamic>{
      "affise_event_add_to_cart": addToCartObject,
      "affise_event_add_to_cart_timestamp": timeStampMillis,
    };
  }

  /// Name of event
  ///
  /// @return name
  @override
  String getName() => "AddToCart";

  /// User data
  ///
  /// @return userData
  @override
  String? getUserData() => userData;
}
