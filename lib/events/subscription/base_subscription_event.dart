import 'package:affise_attribution_lib/events/native_event.dart';

import 'subscription_parameters.dart';

abstract class BaseSubscriptionEvent extends NativeEvent {
  /// Type of subscription
  String get type;

  /// Subtype of subscription
  String get subtype;

  Map<String, dynamic> data;

  String? userData;

  BaseSubscriptionEvent({
    required this.data,
    this.userData,
  });

  /// Serialize SubscriptionEvent to Map
  ///
  /// @return Map of SubscriptionEvent
  @override
  dynamic serialize() {
    Map<String, dynamic> map = {
      //Add subtype
      SubscriptionParameters.AFFISE_SUBSCRIPTION_EVENT_TYPE_KEY: subtype,
    };
    //Add data
    map.addAll(data);
    return map;
  }

  /// Name of event
  ///
  /// @return name
  @override
  String getName() => type;

  /// User data
  ///
  /// @return userData
  @override
  String? getUserData() => userData;

  @override
  Map<String, dynamic> get toMap {
    Map<String, dynamic> map = super.toMap;
    map["subtype"] = subtype;
    map["data"] = data;
    return map;
  }
}
