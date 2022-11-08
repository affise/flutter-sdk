import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'affise.dart';
import 'affise_attribution_lib_platform_interface.dart';
import 'deeplink/on_deeplink_callback.dart';

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

  static const FLUTTER_DEEPLINK_CALLBACK = "registerDeeplinkCallback";

  OnDeeplinkCallback? _onDeeplinkCallback;

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
    methodChannel.invokeMethod(AFFISE_REGISTER_DEEPLINK_CALLBACK, callback);
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
}
