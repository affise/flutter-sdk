import 'base_subscription_event.dart';
import 'subscription_event_name.dart';
import 'subscription_sub_type.dart';

/// Event ConvertedTrial use [data] of event and [userData]
class ConvertedTrialEvent extends BaseSubscriptionEvent {
  ConvertedTrialEvent({
    required super.data,
    super.userData,
  });

  /// Type of event
  @override
  SubscriptionEventName get type => SubscriptionEventName.AFFISE_SUBSCRIPTION_FIRST_CONVERSION;

  /// Subtype of event
  @override
  SubscriptionSubType get subtype => SubscriptionSubType.AFFISE_SUB_CONVERTED_TRIAL;
}

/// Event ConvertedOffer use [data] of event and [userData]
class ConvertedOfferEvent extends BaseSubscriptionEvent {
  ConvertedOfferEvent({
    required super.data,
    super.userData,
  });

  /// Type of event
  @override
  SubscriptionEventName get type => SubscriptionEventName.AFFISE_SUBSCRIPTION_FIRST_CONVERSION;

  /// Subtype of event
  @override
  SubscriptionSubType get subtype => SubscriptionSubType.AFFISE_SUB_CONVERTED_OFFER;
}