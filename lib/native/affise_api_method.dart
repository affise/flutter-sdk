enum AffiseApiMethod {
  INIT,
  IS_INITIALIZED,
  SEND_EVENT,
  SEND_EVENT_NOW,
  ADD_PUSH_TOKEN,
  REGISTER_WEB_VIEW,
  UNREGISTER_WEB_VIEW,
  SET_SECRET_KEY,
  SET_AUTO_CATCHING_TYPES,
  SET_OFFLINE_MODE_ENABLED,
  IS_OFFLINE_MODE_ENABLED,
  SET_BACKGROUND_TRACKING_ENABLED,
  IS_BACKGROUND_TRACKING_ENABLED,
  SET_TRACKING_ENABLED,
  IS_TRACKING_ENABLED,
  FORGET,
  SET_ENABLED_METRICS,
  CRASH_APPLICATION,
  GET_RANDOM_USER_ID,
  GET_RANDOM_DEVICE_ID,
  GET_PROVIDERS,
  MODULE_START,
  GET_MODULES_INSTALLED,
  IS_FIRST_RUN,

  // callbacks
  GET_REFERRER_CALLBACK,
  GET_REFERRER_VALUE_CALLBACK,
  GET_STATUS_CALLBACK,
  REGISTER_DEEPLINK_CALLBACK,
  SKAD_REGISTER_ERROR_CALLBACK,
  SKAD_POSTBACK_ERROR_CALLBACK,

  // debug
  DEBUG_VALIDATE_CALLBACK,
  DEBUG_NETWORK_CALLBACK,
}

AffiseApiMethod? apiMethodFrom(String? name) {
  if (name == null) return null;
  return AffiseApiMethod.values.firstWhere((e) => e.apiName == name);
}

extension AffiseApiMethodExt on AffiseApiMethod {
  String get apiName {
    switch (this) {
      case AffiseApiMethod.INIT:
        return "init";
      case AffiseApiMethod.IS_INITIALIZED:
        return "is_initialized";
      case AffiseApiMethod.SEND_EVENT:
        return "send_event";
      case AffiseApiMethod.SEND_EVENT_NOW:
        return "send_event_now";
      case AffiseApiMethod.ADD_PUSH_TOKEN:
        return "add_push_token";
      case AffiseApiMethod.REGISTER_WEB_VIEW:
        return "register_web_view";
      case AffiseApiMethod.UNREGISTER_WEB_VIEW:
        return "unregister_web_view";
      case AffiseApiMethod.SET_SECRET_KEY:
        return "set_secret_id";
      case AffiseApiMethod.SET_AUTO_CATCHING_TYPES:
        return "set_auto_catching_types";
      case AffiseApiMethod.SET_OFFLINE_MODE_ENABLED:
        return "set_offline_mode_enabled";
      case AffiseApiMethod.IS_OFFLINE_MODE_ENABLED:
        return "is_offline_mode_enabled";
      case AffiseApiMethod.SET_BACKGROUND_TRACKING_ENABLED:
        return "set_background_tracking_enabled";
      case AffiseApiMethod.IS_BACKGROUND_TRACKING_ENABLED:
        return "is_background_tracking_enabled";
      case AffiseApiMethod.SET_TRACKING_ENABLED:
        return "set_tracking_enabled";
      case AffiseApiMethod.IS_TRACKING_ENABLED:
        return "is_tracking_enabled";
      case AffiseApiMethod.FORGET:
        return "forget";
      case AffiseApiMethod.SET_ENABLED_METRICS:
        return "set_enabled_metrics";
      case AffiseApiMethod.CRASH_APPLICATION:
        return "crash_application";
      case AffiseApiMethod.GET_RANDOM_USER_ID:
        return "get_random_user_id";
      case AffiseApiMethod.GET_RANDOM_DEVICE_ID:
        return "get_random_device_id";
      case AffiseApiMethod.GET_PROVIDERS:
        return "get_providers";
      case AffiseApiMethod.MODULE_START:
        return "module_start";
      case AffiseApiMethod.GET_MODULES_INSTALLED:
        return "get_modules_installed";
      case AffiseApiMethod.IS_FIRST_RUN:
        return "is_first_run";
      case AffiseApiMethod.GET_REFERRER_CALLBACK:
        return "get_referrer_callback";
      case AffiseApiMethod.GET_REFERRER_VALUE_CALLBACK:
        return "get_referrer_value_callback";
      case AffiseApiMethod.GET_STATUS_CALLBACK:
        return "get_status_callback";
      case AffiseApiMethod.REGISTER_DEEPLINK_CALLBACK:
        return "register_deeplink_callback";
      case AffiseApiMethod.SKAD_REGISTER_ERROR_CALLBACK:
        return "skad_register_error_callback";
      case AffiseApiMethod.SKAD_POSTBACK_ERROR_CALLBACK:
        return "skad_postback_error_callback";
      case AffiseApiMethod.DEBUG_VALIDATE_CALLBACK:
        return "debug_validate_callback";
      case AffiseApiMethod.DEBUG_NETWORK_CALLBACK:
        return "debug_network_callback";
    }
  }
}
