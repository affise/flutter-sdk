import 'base_subscription_event.dart';
import 'subscription_event_name.dart';
import 'subscription_sub_type.dart';

/// Event Unsubscription use [data] of event and [userData]
class UnsubscriptionEvent extends BaseSubscriptionEvent {
  UnsubscriptionEvent({
    required super.data,
    super.userData,
  });

  /// Type of event
  @override
  SubscriptionEventName get type => SubscriptionEventName.AFFISE_UNSUBSCRIPTION;

  /// Subtype of event
  @override
  SubscriptionSubType get subtype => SubscriptionSubType.AFFISE_SUB_UNSUBSCRIPTION;
}
