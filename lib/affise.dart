import 'package:flutter/scheduler.dart';

import 'affise_init_properties.dart';
import 'deeplink/on_deeplink_callback.dart';
import 'events/auto_catching_type.dart';
import 'events/event.dart';
import 'module/affise_modules.dart';
import 'module/on_key_value_callback.dart';
import 'native_api_interface.dart';
import 'referrer/referrer_callback.dart';
import 'referrer/referrer_key.dart';
import 'callback/error_callback.dart';
import 'native/affise_native.dart';
import 'skad/coarse_value.dart';

export 'affise_init_properties.dart';
export 'events/event.dart';
export 'events/events.dart';
export 'events/subscription_events.dart';
export 'referrer/referrer_key.dart';
export 'module/affise_modules.dart';
export 'module/affise_key_value.dart';
export 'skad/skad_network.dart';


class Affise {
  static final AffiseNative _native = AffiseNative();

  /// Init [AffiseComponent] with [app] and [initProperties]
  static void init(AffiseInitProperties initProperties) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _native.init(initProperties);
    });
  }

  static Future<bool> isInitialized() async { 
    return _native.isInitialized();
  }

  /// Send events
  static void sendEvents() {
    _native.sendEvents();
  }

  /// Store and send [event]
  static void sendEvent(Event event) {
    _native.sendEvent(event);
  }

  /// Add [pushToken]
  static void addPushToken(String pushToken) {
    _native.addPushToken(pushToken);
  }

  /// Register [callback] for deeplink
  static void registerDeeplinkCallback(OnDeeplinkCallback callback) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _native.registerDeeplinkCallback(callback);
    });
  }

  /// Set new [secretKey]
  @Deprecated('Use Affise.setSecretKey(secretKey)')
  static void setSecretId(String secretId) {
    _native.setSecretKey(secretId);
  }

  /// Set new [secretKey]
  static void setSecretKey(String secretKey) {
    _native.setSecretKey(secretKey);
  }

  /// Send enabled autoCatching [types]
  static void setAutoCatchingTypes(List<AutoCatchingType> types) {
    _native.setAutoCatchingTypes(types);
  }

  /// Sets offline mode to [enabled] state
  ///
  /// When enabled, no network activity should be triggered by this library,
  /// but background work is not paused. When offline mode is enabled,
  /// all recorded events should be sent
  static void setOfflineModeEnabled(bool enabled) {
    _native.setOfflineModeEnabled(enabled);
  }

  /// Returns current offline mode state
  static Future<bool> isOfflineModeEnabled() async {
    return _native.isOfflineModeEnabled();
  }

  /// Sets background tracking mode to [enabled] state
  ///
  /// When disabled, library should not generate any tracking events while in background
  static void setBackgroundTrackingEnabled(bool enabled) {
    _native.setBackgroundTrackingEnabled(enabled);
  }

  /// Returns current background tracking state
  static Future<bool> isBackgroundTrackingEnabled() async {
    return _native.isBackgroundTrackingEnabled();
  }

  /// Sets offline mode to [enabled] state
  ///
  /// When disabled, library should not generate any tracking events
  static void setTrackingEnabled(bool enabled) {
    _native.setTrackingEnabled(enabled);
  }

  /// Returns current tracking state
  static Future<bool> isTrackingEnabled() async {
    return _native.isTrackingEnabled();
  }

  /// Set [enabled] collect metrics
  ///
  /// When disabled, library should not generate any metrics events,
  /// but will send the saved metrics events
  static void setEnabledMetrics(bool enabled) {
    _native.setEnabledMetrics(enabled);
  }

  /// Get module status
  static getStatus(AffiseModules module, OnKeyValueCallback callback)  {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _native.getStatus(module, callback);
    });
  }

  /// Get random User Id
  static Future<String> getRandomUserId() async {
    return _native.getRandomUserId();
  }

  /// Get random Device Id
  static Future<String> getRandomDeviceId() async {
    return _native.getRandomDeviceId();
  }

  static AffiseAndroidApi android = _AffiseAndroid(_native);
  static AffiseIOSApi ios = _AffiseIOS(_native);
}

class _AffiseAndroid implements AffiseAndroidApi {

  AffiseNative? native;

  _AffiseAndroid(this.native);

  /// Get referrer
  @override
  void getReferrer(ReferrerCallback callback) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      native?.getReferrer(callback);
    });
  }

  /// Get referrer Value
  @override
  void getReferrerValue(ReferrerKey key, ReferrerCallback callback) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      native?.getReferrerValue(key, callback);
    });
  }

  /// Erases all user data from mobile and sends [GDPREvent]
  @override
  void forget(String userData) {
    native?.forget(userData);
  }

  @override
  void crashApplication() {
    native?.crashApplication();
  }
}

class _AffiseIOS implements AffiseIOSApi {
  AffiseNative? native;

  _AffiseIOS(this.native);
  
  /// SKAd registerAppForAdNetworkAttribution
  @override
  void registerAppForAdNetworkAttribution(ErrorCallback completionHandler) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      native?.registerAppForAdNetworkAttribution(completionHandler);
    });
  }
  
  /// SKAd updatePostbackConversionValue
  @override
  void updatePostbackConversionValue(int fineValue, CoarseValue coarseValue, ErrorCallback completionHandler) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      native?.updatePostbackConversionValue(fineValue, coarseValue.value, completionHandler);
    });
  }
}
