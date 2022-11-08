import 'package:affise_attribution_lib/events/native_event.dart';

/// Event TravelBooking
///
/// @property details the JSON array describing the meaning of the event.
/// @property userData any custom string data.
class TravelBookingEvent extends NativeEvent {
  List<dynamic> details;
  String? userData;

  TravelBookingEvent({
    required this.details,
    this.userData,
  });

  /// Serialize TravelBookingEvent to Map
  ///
  /// @return Map of TravelBookingEvent
  @override
  dynamic serialize() {
    return <String, dynamic>{
      "affise_event_travel_booking": details,
    };
  }

  /// Name of event
  ///
  /// @return name
  @override
  String getName() => "TravelBooking";

  /// User data
  ///
  /// @return userData
  @override
  String? getUserData() => userData;
}
