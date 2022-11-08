import 'package:affise_attribution_lib/events/native_event.dart';

/// Event Search
///
/// @property search the JSON array describing the meaning of the event.
/// @property timeStampMillis the timestamp event in milliseconds.
/// @property userData any custom string data.
class SearchEvent extends NativeEvent {
  List<dynamic> search;
  int timeStampMillis;
  String? userData;

  SearchEvent({
    required this.search,
    required this.timeStampMillis,
    this.userData,
  });

  /// Serialize SearchEvent to Map
  ///
  /// @return Map of SearchEvent
  @override
  dynamic serialize() {
    return <String, dynamic>{
      "affise_event_search": search,
      "affise_event_search_timestamp": timeStampMillis,
    };
  }

  /// Name of event
  ///
  /// @return name
  @override
  String getName() => "Search";

  /// User data
  ///
  /// @return userData
  @override
  String? getUserData() => userData;
}
