import '../utils/timestamp.dart';
import 'event.dart';
import 'property/affise_property.dart';
import 'property/affise_property_builder.dart';

abstract class NativeEvent extends Event {
  String? userData;
  int? timeStampMillis = timestamp();

  NativeEvent({
    this.userData,
    this.timeStampMillis,
  });

  AffisePropertyBuilder serializeBuilder() {
    return AffisePropertyBuilder()
        .init(getName())
        .add(AffiseProperty.TIMESTAMP, timeStampMillis);
  }

  /// Serialize event to dynamic
  ///
  /// @return dynamic
  @override
  dynamic serialize() {
    return serializeBuilder().build();
  }

  /// Category of event
  ///
  /// @return category
  @override
  String getCategory() => "native";

  /// User data
  ///
  /// @return userData
  @override
  String? getUserData() => userData;
}
