import 'package:flutter/scheduler.dart';

import 'affise_attribution_lib_platform_interface.dart';
import 'affise_init_properties.dart';
import 'deeplink/on_deeplink_callback.dart';
import 'events/auto_catching_type.dart';
import 'events/event.dart';
import 'referrer/referrer_callback.dart';
import 'referrer/referrer_key.dart';

export 'affise_init_properties.dart';
export 'affise_flags.dart';
export 'events/event.dart';
export 'events/events.dart';
export 'events/subscription_events.dart';
export 'referrer/referrer_key.dart';
import 'callback/error_callback.dart';


class Affise {
  /// Init [AffiseComponent] with [app] and [initProperties]
  static void init(AffiseInitProperties initProperties) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      AffiseAttributionLibPlatform.instance.init(initProperties);
    });
  }

  /// Send events
  static void sendEvents() {
    AffiseAttributionLibPlatform.instance.sendEvents();
  }

  /// Store and send [event]
  static void sendEvent(Event event) {
    AffiseAttributionLibPlatform.instance.sendEvent(event);
  }

  /// Add [pushToken]
  static void addPushToken(String pushToken) {
    AffiseAttributionLibPlatform.instance.addPushToken(pushToken);
  }

  /// Register [callback] for deeplink
  static void registerDeeplinkCallback(OnDeeplinkCallback callback) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
        AffiseAttributionLibPlatform.instance.registerDeeplinkCallback(callback);
        AffiseAttributionLibPlatform.instance.handleInitialLink();
    });
  }

  /// Set new [secretId]
  static void setSecretId(String secretId) {
    AffiseAttributionLibPlatform.instance.setSecretId(secretId);
  }

  /// Send enabled autoCatching [types]
  static void setAutoCatchingTypes(List<AutoCatchingType> types) {
    AffiseAttributionLibPlatform.instance.setAutoCatchingTypes(types);
  }

  /// Sets offline mode to [enabled] state
  ///
  /// When enabled, no network activity should be triggered by this library,
  /// but background work is not paused. When offline mode is enabled,
  /// all recorded events should be sent
  static void setOfflineModeEnabled(bool enabled) {
    AffiseAttributionLibPlatform.instance.setOfflineModeEnabled(enabled);
  }

  /// Returns current offline mode state
  static Future<bool> isOfflineModeEnabled() async {
    return AffiseAttributionLibPlatform.instance.isOfflineModeEnabled();
  }

  /// Sets background tracking mode to [enabled] state
  ///
  /// When disabled, library should not generate any tracking events while in background
  static void setBackgroundTrackingEnabled(bool enabled) {
    AffiseAttributionLibPlatform.instance.setBackgroundTrackingEnabled(enabled);
  }

  /// Returns current background tracking state
  static Future<bool> isBackgroundTrackingEnabled() async {
    return AffiseAttributionLibPlatform.instance.isBackgroundTrackingEnabled();
  }

  /// Sets offline mode to [enabled] state
  ///
  /// When disabled, library should not generate any tracking events
  static void setTrackingEnabled(bool enabled) {
    AffiseAttributionLibPlatform.instance.setTrackingEnabled(enabled);
  }

  /// Returns current tracking state
  static Future<bool> isTrackingEnabled() async {
    return AffiseAttributionLibPlatform.instance.isTrackingEnabled();
  }

  /// Erases all user data from mobile and sends [GDPREvent]
  static void forget() {
    AffiseAttributionLibPlatform.instance.forget();
  }

  /// Set [enabled] collect metrics
  ///
  /// When disabled, library should not generate any metrics events,
  /// but will send the saved metrics events
  static void setEnabledMetrics(bool enabled) {
    AffiseAttributionLibPlatform.instance.setEnabledMetrics(enabled);
  }

  static void crashApplication() {
    AffiseAttributionLibPlatform.instance.crashApplication();
  }

  /// Get referrer
  @Deprecated('Use Affise.android.getReferrer()')
  static Future<String?> getReferrer() async {
    return AffiseAttributionLibPlatform.instance.getReferrer();
  }

  static const AffiseAndroidApi android = _AffiseAndroid();
  static const AffiseIOSApi ios = _AffiseIOS();
}

class _AffiseAndroid implements AffiseAndroidApi {
  const _AffiseAndroid();

  /// Get referrer
  @override
  Future<String?> getReferrer() async {
    return AffiseAttributionLibPlatform.instance.getReferrer();
  }

  /// Get referrer Value
  @override
  void getReferrerValue(ReferrerKey key, ReferrerCallback callback) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      AffiseAttributionLibPlatform.instance.getReferrerValue(key, callback);
    });
  }
}

class _AffiseIOS implements AffiseIOSApi {
  const _AffiseIOS();
  
  /// SKAd registerAppForAdNetworkAttribution
  @override
  void registerAppForAdNetworkAttribution(ErrorCallback completionHandler) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      AffiseAttributionLibPlatform.instance.registerAppForAdNetworkAttribution(completionHandler);
    });
  }
  
  /// SKAd updatePostbackConversionValue
  @override
  void updatePostbackConversionValue(int fineValue, String coarseValue, ErrorCallback completionHandler) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      AffiseAttributionLibPlatform.instance.updatePostbackConversionValue(fineValue, coarseValue, completionHandler);
    });
  }
}
