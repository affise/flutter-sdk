import 'package:affise_attribution_lib/events/native_event.dart';

/// Event AddToWishlist
///
/// @property wishList the JSON Object describing the meaning of the event.
/// @property timeStampMillis the timestamp event in milliseconds.
/// @property userData any custom string data.
class AddToWishlistEvent extends NativeEvent {
  Map<String, dynamic> wishList;
  int timeStampMillis;
  String? userData;

  AddToWishlistEvent({
    required this.wishList,
    required this.timeStampMillis,
    this.userData,
  });

  /// Serialize AddToWishlistEvent to Map
  ///
  /// @return Map of AddToWishlistEvent
  @override
  dynamic serialize() {
    return <String, dynamic>{
      "affise_event_add_to_wishlist": wishList,
      "affise_event_add_to_wishlist_timestamp": timeStampMillis,
    };
  }

  /// Name of event
  ///
  /// @return name
  @override
  String getName() => "AddToWishlist";

  /// User data
  ///
  /// @return userData
  @override
  String? getUserData() => userData;
}
