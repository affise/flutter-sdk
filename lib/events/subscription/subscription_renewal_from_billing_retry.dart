import 'base_subscription_event.dart';
import 'subscription_event_name.dart';
import 'subscription_sub_type.dart';

/// Event ConvertedTrialFromRetry use [data] of event and [userData]
class ConvertedTrialFromRetryEvent extends BaseSubscriptionEvent {
  ConvertedTrialFromRetryEvent({
    required super.data,
    super.userData,
  });

  /// Type of event
  @override
  SubscriptionEventName get type => SubscriptionEventName.AFFISE_SUBSCRIPTION_RENEWAL_FROM_BILLING_RETRY;

  /// Subtype of event
  @override
  SubscriptionSubType get subtype => SubscriptionSubType.AFFISE_SUB_CONVERTED_TRIAL_FROM_RETRY;
}

/// Event ConvertedOfferFromRetry use [data] of event and [userData]
class ConvertedOfferFromRetryEvent extends BaseSubscriptionEvent {
  ConvertedOfferFromRetryEvent({
    required super.data,
    super.userData,
  });

  /// Type of event
  @override
  SubscriptionEventName get type => SubscriptionEventName.AFFISE_SUBSCRIPTION_RENEWAL_FROM_BILLING_RETRY;

  /// Subtype of event
  @override
  SubscriptionSubType get subtype => SubscriptionSubType.AFFISE_SUB_CONVERTED_OFFER_FROM_RETRY;
}

/// Event RenewedSubscriptionFromRetry use [data] of event and [userData]
class RenewedSubscriptionFromRetryEvent extends BaseSubscriptionEvent {
  RenewedSubscriptionFromRetryEvent({
    required super.data,
    super.userData,
  });

  /// Type of event
  @override
  SubscriptionEventName get type => SubscriptionEventName.AFFISE_SUBSCRIPTION_RENEWAL_FROM_BILLING_RETRY;

  /// Subtype of event
  @override
  SubscriptionSubType get subtype => SubscriptionSubType.AFFISE_SUB_RENEWED_SUBSCRIPTION_FROM_RETRY;
}
