import 'package:affise_attribution_lib/events/native_event.dart';

/// Event AddPaymentInfo
///
/// @property paymentInfo the JSON Object describing the meaning of the event.
/// @property timeStampMillis the timestamp event in milliseconds.
/// @property userData any custom string data.
class AddPaymentInfoEvent extends NativeEvent {
  Map<String, dynamic> paymentInfo;
  int timeStampMillis;
  String? userData;

  AddPaymentInfoEvent({
    required this.paymentInfo,
    required this.timeStampMillis,
    this.userData,
  });

  /// Serialize AddPaymentInfoEvent to Map
  ///
  /// @return Map of AddPaymentInfoEvent
  @override
  dynamic serialize() {
    return <String, dynamic>{
      "affise_event_add_payment_info": paymentInfo,
      "affise_event_add_payment_info_timestamp": timeStampMillis,
    };
  }

  /// Name of event
  ///
  /// @return name
  @override
  String getName() => "AddPaymentInfo";

  /// User data
  ///
  /// @return userData
  @override
  String? getUserData() => userData;
}
