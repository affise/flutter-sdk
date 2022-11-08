import 'base_subscription_event.dart';
import 'subscription_parameters.dart';

/// Event ConvertedTrial use [data] of event and [userData]
class ConvertedTrialEvent extends BaseSubscriptionEvent {
  ConvertedTrialEvent({
    required super.data,
    super.userData,
  });

  /// Type of event
  @override
  String get type => SubscriptionParameters.AFFISE_SUBSCRIPTION_FIRST_CONVERSION;

  /// Subtype of event
  @override
  String get subtype => SubscriptionParameters.AFFISE_SUB_CONVERTED_TRIAL;
}

/// Event ConvertedOffer use [data] of event and [userData]
class ConvertedOfferEvent extends BaseSubscriptionEvent {
  ConvertedOfferEvent({
    required super.data,
    super.userData,
  });

  /// Type of event
  @override
  String get type => SubscriptionParameters.AFFISE_SUBSCRIPTION_FIRST_CONVERSION;

  /// Subtype of event
  @override
  String get subtype => SubscriptionParameters.AFFISE_SUB_CONVERTED_OFFER;
}