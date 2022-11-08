import 'package:affise_attribution_lib/events/native_event.dart';

/// Event Purchase use
///
/// @property purchaseData the JSON Object describing the meaning of the event.
/// @property timeStampMillis the timestamp event in milliseconds.
/// @property userData any custom string data.
class PurchaseEvent extends NativeEvent {
  Map<String, dynamic> purchaseData;
  int timeStampMillis;
  String? userData;

  PurchaseEvent({
    required this.purchaseData,
    required this.timeStampMillis,
    this.userData,
  });

  /// Serialize PurchaseEvent to Map
  ///
  /// @return Map of PurchaseEvent
  @override
  dynamic serialize() {
    return <String, dynamic>{
      "affise_event_purchase": purchaseData,
      "affise_event_purchase_timestamp": timeStampMillis,
    };
  }

  /// Name of event
  ///
  /// @return name
  @override
  String getName() => "Purchase";

  /// User data
  ///
  /// @return userData
  @override
  String? getUserData() => userData;
}
