import 'package:affise_attribution_lib/events/native_event.dart';

/// When a user has some achieve level event.
///
/// @property level the Map describing the meaning of the event.
/// @property timeStampMillis the timestamp event in milliseconds.
/// @property userData any custom string data.
class AchieveLevelEvent extends NativeEvent {
  Map<String, dynamic> level;
  int timeStampMillis;
  String? userData;

  AchieveLevelEvent({
    required this.level,
    required this.timeStampMillis,
    this.userData,
  });

  /// Serialize AchieveLevelEvent to Map
  ///
  /// @return Map of AchieveLevelEvent
  @override
  dynamic serialize() {
    return <String, dynamic>{
      "affise_event_achieve_level": level,
      "affise_event_achieve_level_timestamp": timeStampMillis,
    };
  }

  /// Name of event
  ///
  /// @return name
  @override
  String getName() => "AchieveLevel";

  /// User data
  ///
  /// @return userData
  @override
  String? getUserData() => userData;

  @override
  Map<String, dynamic> get toMap {
    Map<String, dynamic> map = super.toMap;
    map["level"] = level;
    map["timeStampMillis"] = timeStampMillis;
    return map;
  }
}