import 'package:affise_attribution_lib/events/native_event.dart';

/// Event Sales
///
/// @property salesData the JSON Object describing the meaning of the event.
/// @property timeStampMillis the timestamp event in milliseconds.
/// @property userData any custom string data.
class SalesEvent extends NativeEvent {
  Map<String, dynamic> salesData;
  int timeStampMillis;
  String? userData;

  SalesEvent({
    required this.salesData,
    required this.timeStampMillis,
    this.userData,
  });

  /// Serialize SalesEvent to Map
  ///
  /// @return Map of SalesEvent
  @override
  dynamic serialize() {
    return <String, dynamic>{
      "affise_event_sales": salesData,
      "affise_event_sales_timestamp": timeStampMillis,
    };
  }

  /// Name of event
  ///
  /// @return name
  @override
  String getName() => "Sales";

  /// User data
  ///
  /// @return userData
  @override
  String? getUserData() => userData;
}
