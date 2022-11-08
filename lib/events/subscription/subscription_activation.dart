import 'base_subscription_event.dart';
import 'subscription_parameters.dart';

/// Event InitialSubscription use [data] of event and [userData]
class InitialSubscriptionEvent extends BaseSubscriptionEvent {

  InitialSubscriptionEvent({
    required super.data,
    super.userData,
  });

  /// Type of event
  @override
  String get type => SubscriptionParameters.AFFISE_SUBSCRIPTION_ACTIVATION;

  /// Subtype of event
  @override
  String get subtype => SubscriptionParameters.AFFISE_SUB_INITIAL_SUBSCRIPTION;
}

/// Event InitialTrial use [data] of event and [userData]
class InitialTrialEvent extends BaseSubscriptionEvent {

  InitialTrialEvent({
    required super.data,
    super.userData,
  });

  /// Type of event
  @override
  String get type => SubscriptionParameters.AFFISE_SUBSCRIPTION_ACTIVATION;

  /// Subtype of event
  @override
  String get subtype => SubscriptionParameters.AFFISE_SUB_INITIAL_TRIAL;
}


/// Event InitialOffer use [data] of event and [userData]
class InitialOfferEvent extends BaseSubscriptionEvent {

  InitialOfferEvent({
    required super.data,
    super.userData,
  });

  /// Type of event
  @override
  String get type => SubscriptionParameters.AFFISE_SUBSCRIPTION_ACTIVATION;

  /// Subtype of event
  @override
  String get subtype => SubscriptionParameters.AFFISE_SUB_INITIAL_OFFER;
}