import '../affise_init_properties.dart';
import '../callback/error_callback.dart';
import '../deeplink/on_deeplink_callback.dart';
import '../events/auto_catching_type.dart';
import '../events/event.dart';
import '../events/event_to_serialized_event_converter.dart';
import '../module/affise_modules.dart';
import '../module/affise_key_value.dart';
import '../module/on_key_value_callback.dart';
import '../referrer/referrer_callback.dart';
import '../referrer/referrer_key.dart';
import '../utils/try_cast.dart';
import 'affise_api_method.dart';
import 'native_base.dart';

class AffiseNative extends NativeBase {

  EventToSerializedEventConverter  converter = EventToSerializedEventConverter();

  void init(AffiseInitProperties initProperties) {
    native(AffiseApiMethod.INIT, initProperties.toMap);
  }

  Future<bool> isInitialized() async {
    return await native(AffiseApiMethod.IS_INITIALIZED);
  }

  void sendEvents() {
    native(AffiseApiMethod.SEND_EVENTS);
  }

  void sendEvent(Event event) {
    native(AffiseApiMethod.SEND_EVENT, converter.convert(event));
  }

  void addPushToken(String pushToken) {
    native(AffiseApiMethod.ADD_PUSH_TOKEN, pushToken);
  }

  void registerDeeplinkCallback(OnDeeplinkCallback callback) {
    nativeCallback(AffiseApiMethod.REGISTER_DEEPLINK_CALLBACK, callback);
  }

  void setSecretKey(String secretKey) {
    native(AffiseApiMethod.SET_SECRET_KEY, secretKey);
  }

  void setAutoCatchingTypes(List<AutoCatchingType> types) {
    native(AffiseApiMethod.SET_AUTO_CATCHING_TYPES, types.toStringList);
  }

  void setOfflineModeEnabled(bool enabled) {
    native(AffiseApiMethod.SET_OFFLINE_MODE_ENABLED, enabled);
  }

  Future<bool> isOfflineModeEnabled() async {
    return await native(AffiseApiMethod.IS_OFFLINE_MODE_ENABLED);
  }

  void setBackgroundTrackingEnabled(bool enabled) {
    native(AffiseApiMethod.SET_BACKGROUND_TRACKING_ENABLED, enabled);
  }

  Future<bool> isBackgroundTrackingEnabled() async {
    return await native(AffiseApiMethod.IS_BACKGROUND_TRACKING_ENABLED);
  }

  void setTrackingEnabled(bool enabled) {
    native(AffiseApiMethod.SET_TRACKING_ENABLED, enabled);
  }

  Future<bool> isTrackingEnabled() async {
    return await native(AffiseApiMethod.IS_TRACKING_ENABLED);
  }

  void forget(String userData) {
    native(AffiseApiMethod.FORGET, userData);
  }

  void setEnabledMetrics(bool enabled) {
    native(AffiseApiMethod.SET_ENABLED_METRICS, enabled);
  }

  void crashApplication() {
    native(AffiseApiMethod.CRASH_APPLICATION);
  }

  void getReferrer(ReferrerCallback callback) {
    nativeCallback(AffiseApiMethod.GET_REFERRER_CALLBACK, callback);
  }

  void getReferrerValue(ReferrerKey key, ReferrerCallback callback) {
    nativeCallback(AffiseApiMethod.GET_REFERRER_VALUE_CALLBACK, callback, key.value);
  }

  void getStatus(AffiseModules module, OnKeyValueCallback callback) {
    nativeCallback(AffiseApiMethod.GET_STATUS_CALLBACK, callback, module.value);
  }

  Future<String> getRandomUserId() async {
    return await native(AffiseApiMethod.GET_RANDOM_USER_ID);
  }

  Future<String> getRandomDeviceId() async {
    return await native(AffiseApiMethod.GET_RANDOM_DEVICE_ID);
  }

  void registerAppForAdNetworkAttribution(ErrorCallback completionHandler) {
    nativeCallback(AffiseApiMethod.SKAD_REGISTER_ERROR_CALLBACK, completionHandler);
  }

  void updatePostbackConversionValue(int fineValue, String coarseValue, ErrorCallback completionHandler) {
    Map<String, dynamic> value = {
      'fineValue': fineValue,
      'coarseValue': coarseValue,
    };
    nativeCallback(AffiseApiMethod.SKAD_POSTBACK_ERROR_CALLBACK, completionHandler, value);
  }

  @override
  void handleCallback(AffiseApiMethod api, dynamic callback, dynamic data) {
    if (callback == null) return;
    switch (api) {
      case AffiseApiMethod.REGISTER_DEEPLINK_CALLBACK:
        tryCast<OnDeeplinkCallback>(callback)?.call(Uri.parse(data?.toString() ?? ""));
        break;
      case AffiseApiMethod.GET_REFERRER_CALLBACK:
        tryCast<ReferrerCallback>(callback)?.call(data?.toString() ?? "");
        break;
      case AffiseApiMethod.GET_REFERRER_VALUE_CALLBACK:
        tryCast<ReferrerCallback>(callback)?.call(data?.toString() ?? "");
        break;
      case AffiseApiMethod.GET_STATUS_CALLBACK:
        List<AffiseKeyValue> list = tryCast<List<Object?>>(data)?.toAffiseKeyValueList ?? [];
        tryCast<OnKeyValueCallback>(callback)?.call(list);
        break;
      case AffiseApiMethod.SKAD_REGISTER_ERROR_CALLBACK:
        tryCast<ErrorCallback>(callback)?.call(data?.toString() ?? "");
        break;
      case AffiseApiMethod.SKAD_POSTBACK_ERROR_CALLBACK:
        tryCast<ErrorCallback>(callback)?.call(data?.toString() ?? "");
        break;
      default:
        break;
    }
  }
}