import 'base_subscription_event.dart';
import 'subscription_event_name.dart';
import 'subscription_sub_type.dart';

/// Event RenewedSubscription use [data] of event and [userData]
class RenewedSubscriptionEvent extends BaseSubscriptionEvent {
  RenewedSubscriptionEvent({
    required super.data,
    super.userData,
  });

  /// Type of event
  @override
  SubscriptionEventName get type => SubscriptionEventName.AFFISE_SUBSCRIPTION_RENEWAL;

  /// Subtype of event
  @override
  SubscriptionSubType get subtype => SubscriptionSubType.AFFISE_SUB_RENEWED_SUBSCRIPTION;
}
