import 'package:affise_attribution_lib/events/native_event.dart';

/// Event UnlockAchievement
///
/// @property achievement the JSON Object describing the meaning of the event.
/// @property timeStampMillis the timestamp event in milliseconds.
/// @property userData any custom string data.
class UnlockAchievementEvent extends NativeEvent {
  Map<String, dynamic> achievement;
  int timeStampMillis;
  String? userData;

  UnlockAchievementEvent({
    required this.achievement,
    required this.timeStampMillis,
    this.userData,
  });

  /// Serialize UnlockAchievementEvent to Map
  ///
  /// @return Map of UnlockAchievementEvent
  @override
  dynamic serialize() {
    return <String, dynamic>{
      "affise_event_unlock_achievement": achievement,
      "affise_event_unlock_achievement_timestamp": timeStampMillis,
    };
  }

  /// Name of event
  ///
  /// @return name
  @override
  String getName() => "UnlockAchievement";

  /// User data
  ///
  /// @return userData
  @override
  String? getUserData() => userData;
}