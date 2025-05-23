import 'dart:async';

import 'package:flutter/scheduler.dart';

import 'module/appsflyer/affise_appsflyer.dart';
import 'module/link/affise_link.dart';
import 'module/subscription/affise_subscription.dart';
import 'native_api_interface.dart';
import 'native/affise_native.dart';
import 'export.dart';

export 'export.dart';

class Affise {
  static final AffiseNative _native = AffiseNative();

  /// Affise SDK settings builder
  static AffiseSettings settings({required String affiseAppId, required String secretKey}) {
    return AffiseSettings(affiseAppId, secretKey);
  }

  /// Init [AffiseComponent] with [initProperties]
  static void start(AffiseInitProperties initProperties) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _native.init(initProperties);
    });
  }

  @Deprecated('Use `Affise.settings.setOnInitSuccess` instead')
  static Future<bool> isInitialized() async {
    var completer = Completer<bool>();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _native.isInitialized().then((value) {
        completer.complete(value);
      }).catchError((error) {
        completer.completeError(error);
      });
    });
    return completer.future;
  }

  /// Store and send [event]
  static void sendEvent(Event event) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _native.sendEvent(event);
    });
  }

  /// Send [event] now
  static void sendEventNow(Event event, OnSendSuccessCallback success, OnSendFailedCallback failed) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _native.sendEventNow(event, success, failed);
    });
  }

  /// Add [pushToken]
  static void addPushToken(String pushToken) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _native.addPushToken(pushToken);
    });
  }

  /// Register [callback] for deeplink
  static void registerDeeplinkCallback(OnDeeplinkCallback callback) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _native.registerDeeplinkCallback(callback);
    });
  }

  /// Set new [secretKey]
  static void setSecretKey(String secretKey) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _native.setSecretKey(secretKey);
    });
  }

  /// Send enabled autoCatching [types]
  // static void setAutoCatchingTypes(List<AutoCatchingType> types) {
  //   SchedulerBinding.instance.addPostFrameCallback((_) {
  //     _native.setAutoCatchingTypes(types);
  //   });
  // }

  /// Sets offline mode to [enabled] state
  ///
  /// When enabled, no network activity should be triggered by this library,
  /// but background work is not paused. When offline mode is enabled,
  /// all recorded events should be sent
  static void setOfflineModeEnabled(bool enabled) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _native.setOfflineModeEnabled(enabled);
    });
  }

  /// Returns current offline mode state
  static Future<bool> isOfflineModeEnabled() async {
    var completer = Completer<bool>();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _native.isOfflineModeEnabled().then((value) {
        completer.complete(value);
      }).catchError((error) {
        completer.completeError(error);
      });
    });
    return completer.future;
  }

  /// Sets background tracking mode to [enabled] state
  ///
  /// When disabled, library should not generate any tracking events while in background
  static void setBackgroundTrackingEnabled(bool enabled) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _native.setBackgroundTrackingEnabled(enabled);
    });
  }

  /// Returns current background tracking state
  static Future<bool> isBackgroundTrackingEnabled() async {
    var completer = Completer<bool>();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _native.isBackgroundTrackingEnabled().then((value) {
        completer.complete(value);
      }).catchError((error) {
        completer.completeError(error);
      });
    });
    return completer.future;
  }

  /// Sets offline mode to [enabled] state
  ///
  /// When disabled, library should not generate any tracking events
  static void setTrackingEnabled(bool enabled) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _native.setTrackingEnabled(enabled);
    });
  }

  /// Returns current tracking state
  static Future<bool> isTrackingEnabled() async {
    var completer = Completer<bool>();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _native.isTrackingEnabled().then((value) {
        completer.complete(value);
      }).catchError((error) {
        completer.completeError(error);
      });
    });
    return completer.future;
  }

  /// Set [enabled] collect metrics
  ///
  /// When disabled, library should not generate any metrics events,
  /// but will send the saved metrics events
  // static void setEnabledMetrics(bool enabled) {
  //   SchedulerBinding.instance.addPostFrameCallback((_) {
  //     _native.setEnabledMetrics(enabled);
  //   });
  // }

  /// Get module status
  @Deprecated('Use `Affise.module.getStatus` instead')
  static getStatus(AffiseModules module, OnKeyValueCallback callback)  {
    Affise.module.getStatus(module, callback);
  }

  /// Manual module start
  @Deprecated('Use `Affise.module.moduleStart` instead')
  static Future<bool> moduleStart(AffiseModules module) async {
    return Affise.module.moduleStart(module);
  }

  /// Get installed modules
  @Deprecated('Use `Affise.module.getModulesInstalled` instead')
  static Future<List<AffiseModules>> getModulesInstalled() async {
    return Affise.module.getModulesInstalled();
  }

  /// Get random User Id
  static Future<String> getRandomUserId() async {
    var completer = Completer<String>();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _native.getRandomUserId().then((value) {
        completer.complete(value);
      }).catchError((error) {
        completer.completeError(error);
      });
    });
    return completer.future;
  }

  /// Get random Device Id
  static Future<String> getRandomDeviceId() async {
    var completer = Completer<String>();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _native.getRandomDeviceId().then((value) {
        completer.complete(value);
      }).catchError((error) {
        completer.completeError(error);
      });
    });
    return completer.future;
  }

  /// Get providers map
  static Future<Map<ProviderType, dynamic>> getProviders() async {
    var completer = Completer<Map<ProviderType, dynamic>>();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _native.getProviders().then((value) {
        completer.complete(value);
      }).catchError((error) {
        completer.completeError(error);
      });
    });
    return completer.future;
  }

  /// Is it first run
  static Future<bool> isFirstRun() async {
    var completer = Completer<bool>();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _native.isFirstRun().then((value) {
        completer.complete(value);
      }).catchError((error) {
        completer.completeError(error);
      });
    });
    return completer.future;
  }

  /// Get referrer
  @Deprecated('Use `Affise.getReferrerUrl` instead')
  static void getReferrer(ReferrerCallback callback) {
    getReferrerUrl(callback);
  }

  /// Get referrer Value
  @Deprecated('Use `Affise.getReferrerUrlValue` instead')
  static void getReferrerValue(ReferrerKey key, ReferrerCallback callback) {
    getReferrerUrlValue(key, callback);
  }

  /// Get referrer
  static void getReferrerUrl(ReferrerCallback callback) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _native.getReferrerUrl(callback);
    });
  }

  /// Get referrer Value
  static void getReferrerUrlValue(ReferrerKey key, ReferrerCallback callback) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _native.getReferrerUrlValue(key, callback);
    });
  }

  /// Get referrer on server
  @Deprecated('Use `Affise.getDeferredDeeplink` instead')
  static void getReferrerOnServer(ReferrerCallback callback) {
    Affise.getDeferredDeeplink(callback);
  }

  /// Get referrer on server value
  @Deprecated('Use `Affise.getDeferredDeeplinkValue` instead')
  static void getReferrerOnServerValue(ReferrerKey key, ReferrerCallback callback) {
    Affise.getDeferredDeeplinkValue(key, callback);
  }

  /// Get deferred deeplink on server
  static void getDeferredDeeplink(ReferrerCallback callback) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _native.getDeferredDeeplink(callback);
    });
  }

  /// Get deferred deeplink value on server
  static void getDeferredDeeplinkValue(ReferrerKey key, ReferrerCallback callback) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _native.getDeferredDeeplinkValue(key, callback);
    });
  }

  static AffiseModulesApi module = _AffiseModules(_native);
  static AffiseAndroidApi android = _AffiseAndroid(_native);
  static AffiseIOSApi ios = _AffiseIOS(_native);
  static AffiseDebug debug = _AffiseDebug(_native);
}

class _AffiseModules implements AffiseModulesApi {

  final AffiseNative _native;

  @override
  final AffiseModuleAppsFlyerApi appsFlyer;

  @override
  AffiseModuleLinkApi link;

  @override
  AffiseModuleSubscriptionApi subscription;

  _AffiseModules(this._native) :
        appsFlyer = _AffiseModuleAppsFlyer(_native),
        link = _AffiseModuleLink(_native),
        subscription = _AffiseModuleSubscription(_native);

  /// Get module status
  @override
  getStatus(AffiseModules module, OnKeyValueCallback callback)  {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _native.getStatus(module, callback);
    });
  }

  /// Manual module start
  @override
  Future<bool> moduleStart(AffiseModules module) async {
    var completer = Completer<bool>();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _native.moduleStart(module).then((value) {
        completer.complete(value);
      }).catchError((error) {
        completer.completeError(error);
      });
    });
    return completer.future;
  }

  /// Get installed modules
  @override
  Future<List<AffiseModules>> getModulesInstalled() async {
    var completer = Completer<List<AffiseModules>>();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _native.getModulesInstalled().then((value) {
        completer.complete(value);
      }).catchError((error) {
        completer.completeError(error);
      });
    });
    return completer.future;
  }

  /// Module Link url Resolve
  @Deprecated('Use `Affise.module.link.resolve` instead')
  @override
  void linkResolve(String url, AffiseLinkCallback callback) {
    link.resolve(url, callback);
  }

  /// Module subscription fetchProducts
  @Deprecated('Use `Affise.module.subscription.fetchProducts` instead')
  @override
  void fetchProducts(
    List<String> ids,
    AffiseResultCallback<AffiseProductsResult> callback,
  ) {
    subscription.fetchProducts(ids, callback);
  }

  /// Module subscription purchase
  @Deprecated('Use `Affise.module.subscription.purchase` instead')
  @override
  void purchase(
    AffiseProduct product,
    AffiseProductType type,
    AffiseResultCallback<AffisePurchasedInfo> callback,
  ) {
    subscription.purchase(product, type, callback);
  }
}

class _AffiseAndroid implements AffiseAndroidApi {

  final AffiseNative? _native;

  _AffiseAndroid(this._native);

  /// Erases all user data from mobile and sends [GDPREvent]
  @override
  void forget(String userData) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _native?.forget(userData);
    });
  }

  @override
  void crashApplication() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _native?.crashApplication();
    });
  }
}

class _AffiseIOS implements AffiseIOSApi {
  final AffiseNative? _native;

  _AffiseIOS(this._native);

  /// SKAd registerAppForAdNetworkAttribution
  @override
  void registerAppForAdNetworkAttribution(ErrorCallback completionHandler) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _native?.registerAppForAdNetworkAttribution(completionHandler);
    });
  }

  /// SKAd updatePostbackConversionValue
  @override
  void updatePostbackConversionValue(int fineValue, CoarseValue coarseValue, ErrorCallback completionHandler) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _native?.updatePostbackConversionValue(fineValue, coarseValue.value, completionHandler);
    });
  }

  /// Get referrer on server
  @Deprecated('Use `Affise.getDeferredDeeplink` instead')
  @override
  void getReferrerOnServer(ReferrerCallback callback) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _native?.getDeferredDeeplink(callback);
    });
  }

  /// Get referrer on server value
  @Deprecated('Use `Affise.getDeferredDeeplinkValue` instead')
  @override
  void getReferrerOnServerValue(ReferrerKey key, ReferrerCallback callback) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _native?.getDeferredDeeplinkValue(key, callback);
    });
  }
}

class _AffiseDebug implements AffiseDebug {
  final AffiseNative? _native;

  _AffiseDebug(this._native);

  /// Debug validate
  @override
  void validate(DebugOnValidateCallback callback) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _native?.validate(callback);
    });
  }

  /// Debug network request/response
  @override
  void network(DebugOnNetworkCallback callback) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _native?.network(callback);
    });
  }

  /// Debug get version of flutter library
  @override
  String version() {
    return "1.6.35";
  }

  /// Debug get version of native library Android/iOS
  @override
  Future<String> versionNative() {
    var completer = Completer<String>();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _native?.versionNative().then((value) {
        completer.complete(value);
      }).catchError((error) {
        completer.completeError(error);
      });
    });
    return completer.future;
  }
}

class _AffiseModuleAppsFlyer extends AffiseAppsFlyer {
  _AffiseModuleAppsFlyer(super.native);
}

class _AffiseModuleLink extends AffiseLink {
  _AffiseModuleLink(super.native);
}

class _AffiseModuleSubscription extends AffiseSubscription {
  _AffiseModuleSubscription(super.native);
}
