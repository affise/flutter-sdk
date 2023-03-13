import 'base_subscription_event.dart';
import 'subscription_parameters.dart';

/// Event Unsubscription use [data] of event and [userData]
class UnsubscriptionEvent extends BaseSubscriptionEvent {
  UnsubscriptionEvent({
    required super.data,
    super.userData,
  });

  /// Type of event
  @override
  String get type => SubscriptionParameters.AFFISE_UNSUBSCRIPTION;

  /// Subtype of event
  @override
  String get subtype => SubscriptionParameters.AFFISE_SUB_UNSUBSCRIPTION;
}
