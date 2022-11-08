import 'package:affise_attribution_lib/events/native_event.dart';

/// Event InitiatePurchase
///
/// @property purchaseData the JSON Object describing the meaning of the event.
/// @property timeStampMillis the timestamp event in milliseconds.
/// @property userData any custom string data.
class InitiatePurchaseEvent extends NativeEvent {
  Map<String, dynamic> purchaseData;
  int timeStampMillis;
  String? userData;

  InitiatePurchaseEvent({
    required this.purchaseData,
    required this.timeStampMillis,
    this.userData,
  });

  /// Serialize InitiatePurchaseEvent to Map
  ///
  /// @return Map of InitiatePurchaseEvent
  @override
  dynamic serialize() {
    return <String, dynamic>{
      "affise_event_initiate_purchase": purchaseData,
      "affise_event_initiate_purchase_timestamp": timeStampMillis,
    };
  }

  /// Name of event
  ///
  /// @return name
  @override
  String getName() => "InitiatePurchase";

  /// User data
  ///
  /// @return userData
  @override
  String? getUserData() => userData;
}
