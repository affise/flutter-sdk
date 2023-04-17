import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'affise.dart';
import 'affise_attribution_lib_platform_interface.dart';
import 'deeplink/on_deeplink_callback.dart';
import 'referrer/referrer_callback.dart';
import 'callback/error_callback.dart';

/// An implementation of [AffiseAttributionLibPlatform] that uses method channels.
class MethodChannelAffiseAttributionLib extends AffiseAttributionLibPlatform {
  static const CHANNEL = "affise_sdk/api";

  final AFFISE_INIT = "init";
  final AFFISE_SEND_EVENTS = "send_events";
  final AFFISE_SEND_EVENT = "send_event";
  final AFFISE_ADD_PUSH_TOKEN = "add_push_token";
  final AFFISE_REGISTER_WEB_VIEW = "register_web_view";
  final AFFISE_UNREGISTER_WEB_VIEW = "unregister_web_view";
  final AFFISE_REGISTER_DEEPLINK_CALLBACK = "register_Deeplink_Callback";
  final AFFISE_SET_SECRET_ID = "set_secret_id";
  final AFFISE_SET_AUTO_CATCHING_TYPES = "set_auto_catching_types";
  final AFFISE_SET_OFFLINE_MODE_ENABLED = "set_offline_mode_enabled";
  final AFFISE_IS_OFFLINE_MODE_ENABLED = "is_offline_mode_enabled";
  final AFFISE_SET_BACKGROUND_TRACKING_ENABLED = "set_background_tracking_enabled";
  final AFFISE_IS_BACKGROUND_TRACKING_ENABLED = "is_background_tracking_enabled";
  final AFFISE_SET_TRACKING_ENABLED = "set_tracking_enabled";
  final AFFISE_IS_TRACKING_ENABLED = "is_tracking_enabled";
  final AFFISE_FORGET = "forget";
  final AFFISE_SET_ENABLED_METRICS = "set_enabled_metrics";
  final AFFISE_CRASH_APPLICATION = "crash_application";
  final AFFISE_GET_REFERRER = "get_referrer";
  final AFFISE_GET_REFERRER_VALUE = "get_referrer_value";
  final AFFISE_SKAD_REGISTER = "skad_register";
  final AFFISE_SKAD_POSTBACK = "skad_postback";

  final AFFISE_HANDLE_INITIAL_LINK = "handle_initial_link";

  static const FLUTTER_DEEPLINK_CALLBACK = "registerDeeplinkCallback";
  static const FLUTTER_GET_REFERRER_VALUE_CALLBACK = "getReferrerCallback";
  static const FLUTTER_SKAD_REGISTER_ERROR = "skadRegisterError";
  static const FLUTTER_SKAD_POSTBACK_ERROR = "skadPostbackError";

  OnDeeplinkCallback? _onDeeplinkCallback;
  ReferrerCallback? _onGetReferrerCallback;
  ErrorCallback? _onSkadRegisterErrorCallback;
  ErrorCallback? _onSkadPostbackErrorCallback;

  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel(CHANNEL);

  MethodChannelAffiseAttributionLib() {
    _initFlutterCallbacks();
  }

  void _initFlutterCallbacks() {
    methodChannel.setMethodCallHandler((MethodCall call) async {
      try {
        switch (call.method) {
          case FLUTTER_DEEPLINK_CALLBACK:
            _onDeeplinkCallback?.call(Uri.parse(call.arguments.toString()));
            break;
          case FLUTTER_GET_REFERRER_VALUE_CALLBACK:
            _onGetReferrerCallback?.call(call.arguments.toString());
            break;
          case FLUTTER_SKAD_REGISTER_ERROR:
            _onSkadRegisterErrorCallback?.call(call.arguments.toString());
            break;
          case FLUTTER_SKAD_POSTBACK_ERROR:
            _onSkadPostbackErrorCallback?.call(call.arguments.toString());
            break;
        }
      } catch (e) {
        if (kDebugMode) {
          print(e.toString());
        }
      }
    });
  }

  /// Init [AffiseComponent] with [app] and [initProperties]
  @override
  void init(AffiseInitProperties initProperties) {
    methodChannel.invokeMethod(AFFISE_INIT, initProperties.toMap);
  }

  /// Send events
  @override
  void sendEvents() {
    methodChannel.invokeMethod(AFFISE_SEND_EVENTS);
  }

  /// Store and send [event]
  @override
  void sendEvent(Event event) {
    methodChannel.invokeMethod(AFFISE_SEND_EVENT, event.toMap);
  }

  /// Add [pushToken]
  @override
  void addPushToken(String pushToken) {
    methodChannel.invokeMethod(AFFISE_ADD_PUSH_TOKEN, pushToken);
  }

  /// Register [callback] for deeplink
  @override
  void registerDeeplinkCallback(OnDeeplinkCallback callback) {
    _onDeeplinkCallback = callback;
    methodChannel.invokeMethod(AFFISE_REGISTER_DEEPLINK_CALLBACK);
  }

  /// Set new [secretId]
  @override
  void setSecretId(String secretId) {
    methodChannel.invokeMethod(AFFISE_SET_SECRET_ID, secretId);
  }

  /// Send enabled autoCatching [types]
  @override
  void setAutoCatchingTypes(List<AutoCatchingType> types) {
    methodChannel.invokeMethod(
        AFFISE_SET_AUTO_CATCHING_TYPES, types.toStringList);
  }

  /// Sets offline mode to [enabled] state
  ///
  /// When enabled, no network activity should be triggered by this library,
  /// but background work is not paused. When offline mode is enabled,
  /// all recorded events should be sent
  @override
  void setOfflineModeEnabled(bool enabled) {
    methodChannel.invokeMethod(AFFISE_SET_OFFLINE_MODE_ENABLED, enabled);
  }

  /// Returns current offline mode state
  @override
  Future<bool> isOfflineModeEnabled() async {
    return await methodChannel.invokeMethod(AFFISE_SET_OFFLINE_MODE_ENABLED);
  }

  /// Sets background tracking mode to [enabled] state
  ///
  /// When disabled, library should not generate any tracking events while in background
  @override
  void setBackgroundTrackingEnabled(bool enabled) {
    methodChannel.invokeMethod(AFFISE_SET_BACKGROUND_TRACKING_ENABLED, enabled);
  }

  /// Returns current background tracking state
  @override
  Future<bool> isBackgroundTrackingEnabled() async {
    return await methodChannel
        .invokeMethod(AFFISE_IS_BACKGROUND_TRACKING_ENABLED);
  }

  /// Sets offline mode to [enabled] state
  ///
  /// When disabled, library should not generate any tracking events
  @override
  void setTrackingEnabled(bool enabled) {
    methodChannel.invokeMethod(AFFISE_SET_TRACKING_ENABLED, enabled);
  }

  /// Returns current tracking state
  @override
  Future<bool> isTrackingEnabled() async {
    return await methodChannel.invokeMethod(AFFISE_IS_TRACKING_ENABLED);
  }

  /// Erases all user data from mobile and sends [GDPREvent]
  @override
  void forget() {
    methodChannel.invokeMethod(AFFISE_FORGET);
  }

  /// Set [enabled] collect metrics
  ///
  /// When disabled, library should not generate any metrics events,
  /// but will send the saved metrics events
  @override
  void setEnabledMetrics(bool enabled) {
    methodChannel.invokeMethod(AFFISE_SET_ENABLED_METRICS, enabled);
  }

  @override
  void crashApplication() {
    methodChannel.invokeMethod(AFFISE_CRASH_APPLICATION);
  }

  /// Get referrer
  @override
  Future<String?> getReferrer() async {
    return await methodChannel.invokeMethod(AFFISE_GET_REFERRER);
  }

  /// Handle Deeplink InitialLink
  @override
  void handleInitialLink() async {
    methodChannel.invokeMethod(AFFISE_HANDLE_INITIAL_LINK);
  }

  /// Set [key] referrer key
  /// Set [callback] referrer callback
  ///
  /// Get referrer value
  @override
  void getReferrerValue(ReferrerKey key, ReferrerCallback callback) {
    _onGetReferrerCallback = callback;
    methodChannel.invokeMethod(AFFISE_GET_REFERRER_VALUE, key.value);
  }

  /// RegisterAppForAdNetworkAttribution
  @override
  void registerAppForAdNetworkAttribution(ErrorCallback completionHandler) {
    _onSkadRegisterErrorCallback = completionHandler;
    methodChannel.invokeMethod(AFFISE_SKAD_REGISTER);
  }

  /// UpdatePostbackConversionValue
  @override
  void updatePostbackConversionValue(int fineValue, String coarseValue,  ErrorCallback completionHandler) {
    _onSkadPostbackErrorCallback = completionHandler;
    Map<String, dynamic> value = {
      'fineValue': fineValue,
      'coarseValue': coarseValue,
    };
    methodChannel.invokeMethod(AFFISE_SKAD_POSTBACK, value);
  }
}
