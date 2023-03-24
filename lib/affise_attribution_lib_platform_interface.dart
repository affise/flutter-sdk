import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'affise.dart';
import 'affise_attribution_lib_method_channel.dart';
import 'deeplink/on_deeplink_callback.dart';
import 'referrer/referrer_callback.dart';

abstract class AffiseAttributionLibPlatform extends PlatformInterface {
  /// Constructs a AffiseAttributionPlatform.
  AffiseAttributionLibPlatform() : super(token: _token);

  static final Object _token = Object();

  static AffiseAttributionLibPlatform _instance = MethodChannelAffiseAttributionLib();

  /// The default instance of [AffiseAttributionPlatform] to use.
  ///
  /// Defaults to [MethodChannelAffiseAttribution].
  static AffiseAttributionLibPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [AffiseAttributionPlatform] when
  /// they register themselves.
  static set instance(AffiseAttributionLibPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  /// Init [AffiseComponent] with [app] and [initProperties]
  void init(AffiseInitProperties initProperties) {
    throw UnimplementedError('init() has not been implemented.');
  }

  /// Send events
  void sendEvents() {
    throw UnimplementedError('sendEvents() has not been implemented.');
  }

  /// Store and send [event]
  void sendEvent(Event event) {
    throw UnimplementedError('sendEvent() has not been implemented.');
  }

  /// Add [pushToken]
  void addPushToken(String pushToken) {
    throw UnimplementedError('addPushToken() has not been implemented.');
  }

  /// Register [callback] for deeplink
  void registerDeeplinkCallback(OnDeeplinkCallback callback) {
    throw UnimplementedError('registerDeeplinkCallback() has not been implemented.');
  }

  /// Set new [secretId]
  void setSecretId(String secretId) {
    throw UnimplementedError('setSecretId() has not been implemented.');
  }

  /// Send enabled autoCatching [types]
  void setAutoCatchingTypes(List<AutoCatchingType> types) {
    throw UnimplementedError('setAutoCatchingTypes() has not been implemented.');
  }

  /// Sets offline mode to [enabled] state
  ///
  /// When enabled, no network activity should be triggered by this library,
  /// but background work is not paused. When offline mode is enabled,
  /// all recorded events should be sent
  void setOfflineModeEnabled(bool enabled) {
    throw UnimplementedError('setOfflineModeEnabled() has not been implemented.');
  }

  /// Returns current offline mode state
  Future<bool> isOfflineModeEnabled() async {
    throw UnimplementedError('isOfflineModeEnabled() has not been implemented.');
  }

  /// Sets background tracking mode to [enabled] state
  ///
  /// When disabled, library should not generate any tracking events while in background
  void setBackgroundTrackingEnabled(bool enabled) {
    throw UnimplementedError('setBackgroundTrackingEnabled() has not been implemented.');
  }

  /// Returns current background tracking state
  Future<bool> isBackgroundTrackingEnabled() async {
    throw UnimplementedError('isBackgroundTrackingEnabled() has not been implemented.');
  }

  /// Sets offline mode to [enabled] state
  ///
  /// When disabled, library should not generate any tracking events
  void setTrackingEnabled(bool enabled) {
    throw UnimplementedError('setTrackingEnabled() has not been implemented.');
  }

  /// Returns current tracking state
  Future<bool> isTrackingEnabled() async {
    throw UnimplementedError('isTrackingEnabled() has not been implemented.');
  }

  /// Erases all user data from mobile and sends [GDPREvent]
  void forget() {
    throw UnimplementedError('forget() has not been implemented.');
  }

  /// Set [enabled] collect metrics
  ///
  /// When disabled, library should not generate any metrics events,
  /// but will send the saved metrics events
  void setEnabledMetrics(bool enabled) {
    throw UnimplementedError('setEnabledMetrics() has not been implemented.');
  }

  void crashApplication() {
    throw UnimplementedError('crashApplication() has not been implemented.');
  }

  /// Get referrer
  Future<String?> getReferrer() async {
    throw UnimplementedError('getReferrer() has not been implemented.');
  }

  /// Get InitialLink
  void handleInitialLink() async {
    throw UnimplementedError('handleInitialLink() has not been implemented.');
  }

  /// Set [key] referrer key
  /// Set [callback] referrer callback
  ///
  /// Get referrer value
  void getReferrerValue(ReferrerKey key, ReferrerCallback callback) {
    throw UnimplementedError('getReferrerValue() has not been implemented.');
  }
}

abstract class AffiseAndroidApi {
  const AffiseAndroidApi();

  Future<String?> getReferrer();

  void getReferrerValue(ReferrerKey key, ReferrerCallback callback);
}