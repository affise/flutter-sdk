import 'base_subscription_event.dart';
import 'subscription_parameters.dart';

/// Event RenewedSubscription use [data] of event and [userData]
class RenewedSubscriptionEvent extends BaseSubscriptionEvent {
  RenewedSubscriptionEvent({
    required super.data,
    super.userData,
  });

  /// Type of event
  @override
  String get type => SubscriptionParameters.AFFISE_SUBSCRIPTION_RENEWAL;

  /// Subtype of event
  @override
  String get subtype => SubscriptionParameters.AFFISE_SUB_RENEWED_SUBSCRIPTION;
}
