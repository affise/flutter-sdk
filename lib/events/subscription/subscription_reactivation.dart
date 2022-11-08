import 'base_subscription_event.dart';
import 'subscription_parameters.dart';

/// Event ReactivatedSubscription use [data] of event and [userData]
class ReactivatedSubscriptionEvent extends BaseSubscriptionEvent {
  ReactivatedSubscriptionEvent({
    required super.data,
    super.userData,
  });

  /// Type of event
  @override
  String get type => SubscriptionParameters.AFFISE_SUBSCRIPTION_REACTIVATION;

  /// Subtype of event
  @override
  String get subtype => SubscriptionParameters.AFFISE_SUB_REACTIVATED_SUBSCRIPTION;
}
