import 'package:affise_attribution_lib/events/native_event.dart';

/// Event DeepLinked
///
/// @property isLinked event from link or nor
/// @property userData any custom string data.
class DeepLinkedEvent extends NativeEvent {
  bool isLinked;
  String? userData;

  DeepLinkedEvent({
    required this.isLinked,
    this.userData,
  });

  /// Serialize DeepLinkedEvent to Map
  ///
  /// @return Map of DeepLinkedEvent
  @override
  dynamic serialize() {
    return <String, dynamic>{
      "affise_event_deep_linked": isLinked,
    };
  }

  /// Name of event
  ///
  /// @return name
  @override
  String getName() => "DeepLinked";

  /// User data
  ///
  /// @return userData
  @override
  String? getUserData() => userData;
}
