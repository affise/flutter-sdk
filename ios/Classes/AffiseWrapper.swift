import AffiseAttributionLib
import AffiseSKAdNetwork
import Flutter

internal class AffiseWrapper {

    private let AFFISE_INIT = "init"
    private let AFFISE_SEND_EVENTS = "send_events"
    private let AFFISE_SEND_EVENT = "send_event"
    private let AFFISE_ADD_PUSH_TOKEN = "add_push_token"
    private let AFFISE_REGISTER_WEB_VIEW = "register_web_view"
    private let AFFISE_UNREGISTER_WEB_VIEW = "unregister_web_view"
    private let AFFISE_REGISTER_DEEPLINK_CALLBACK = "register_Deeplink_Callback"
    private let AFFISE_SET_SECRET_ID = "set_secret_id"
    private let AFFISE_SET_AUTO_CATCHING_TYPES = "set_auto_catching_types"
    private let AFFISE_SET_OFFLINE_MODE_ENABLED = "set_offline_mode_enabled"
    private let AFFISE_IS_OFFLINE_MODE_ENABLED = "is_offline_mode_enabled"
    private let AFFISE_SET_BACKGROUND_TRACKING_ENABLED = "set_background_tracking_enabled"
    private let AFFISE_IS_BACKGROUND_TRACKING_ENABLED = "is_background_tracking_enabled"
    private let AFFISE_SET_TRACKING_ENABLED = "set_tracking_enabled"
    private let AFFISE_IS_TRACKING_ENABLED = "is_tracking_enabled"
    private let AFFISE_FORGET = "forget"
    private let AFFISE_SET_ENABLED_METRICS = "set_enabled_metrics"
    private let AFFISE_CRASH_APPLICATION = "crash_application"
    private let AFFISE_GET_REFERRER = "get_referrer"
    private let AFFISE_SKAD_REGISTER = "skad_register"
    private let AFFISE_SKAD_POSTBACK = "skad_postback"

    private let AFFISE_HANDLE_INITIAL_LINK = "handle_initial_link"

    private let FLUTTER_DEEPLINK_CALLBACK = "registerDeeplinkCallback"
    private let FLUTTER_SKAD_REGISTER_ERROR = "skadRegisterError"
    private let FLUTTER_SKAD_POSTBACK_ERROR = "skadPostbackError"
    
    private let evensFactory: AffiseEvensFactory = AffiseEvensFactory()
    var channel: FlutterMethodChannel?
    var application: UIApplication?
    var launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    var deepLink: String?
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        case AFFISE_INIT: nativeInit(call, result: result)
        case AFFISE_SEND_EVENTS: nativeSendEvents(call, result: result)
        case AFFISE_SEND_EVENT: nativeSendEvent(call, result: result)
        case AFFISE_ADD_PUSH_TOKEN: nativeAddPushToken(call, result: result)
        case AFFISE_REGISTER_WEB_VIEW: nativeRegisterWebView(call, result: result)
        case AFFISE_UNREGISTER_WEB_VIEW: nativeUnregisterWebView(call, result: result)
        case AFFISE_REGISTER_DEEPLINK_CALLBACK: nativeRegisterDeeplinkCallback(call, result: result)
        case AFFISE_SET_SECRET_ID: nativeSetSecretId(call, result: result)
        case AFFISE_SET_AUTO_CATCHING_TYPES: nativeSetAutoCatchingTypes(call, result: result)
        case AFFISE_SET_OFFLINE_MODE_ENABLED: nativeSetOfflineModeEnabled(call, result: result)
        case AFFISE_IS_OFFLINE_MODE_ENABLED: nativeIsOfflineModeEnabled(call, result: result)
        case AFFISE_SET_BACKGROUND_TRACKING_ENABLED: nativeSetBackgroundTrackingEnabled(call, result: result)
        case AFFISE_IS_BACKGROUND_TRACKING_ENABLED: nativeIsBackgroundTrackingEnabled(call, result: result)
        case AFFISE_SET_TRACKING_ENABLED: nativeSetTrackingEnabled(call, result: result)
        case AFFISE_IS_TRACKING_ENABLED: nativeIsTrackingEnabled(call, result: result)
        case AFFISE_FORGET: nativeForget(call, result: result)
        case AFFISE_SET_ENABLED_METRICS: nativeSetEnabledMetrics(call, result: result)
        case AFFISE_CRASH_APPLICATION: nativeCrashApplication(call, result: result)
        case AFFISE_GET_REFERRER: nativeGetReferrer(call, result: result)
        case AFFISE_HANDLE_INITIAL_LINK: nativeHandleInitialLink(call, result: result)
        case AFFISE_SKAD_REGISTER: nativeSkadRegister(call, result: result)
        case AFFISE_SKAD_POSTBACK: nativeSkadPostback(call, result: result)
        default:
            result(FlutterMethodNotImplemented)
        }
    }
    
    private func nativeInit(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        if application == nil {
            result(FlutterError.init(
                code: "Affise_BAD_INIT",
                message: "No application context" ,
                details: nil
            ))
            return
        }
        
        if let properties = (call.arguments as? [String: Any?])?.toAffiseInitProperties {
            Affise._crossPlatform.flutter()
            Affise.shared.load(app: application!, initProperties: properties, launchOptions: launchOptions)
            result(nil)
        } else {
            result(FlutterError.init(
                code: "AFFISE_BAD_INIT",
                message: "Wrong arguments init" ,
                details: nil
            ))
        }
    }
    
    private func nativeSendEvent(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        let map = call.arguments as? [String: Any?]
        
        if let event = evensFactory.event(map) {
            Affise.shared.sendEvent(event: event)
            result(nil)
        } else {
            result(FlutterError.init(
                code: "AFFISE_EVENT_BAD_ARGS",
                message: "Wrong argument map" ,
                details: nil
            ))
        }
    }
    
    private func nativeSendEvents(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        Affise.shared.sendEvents()
        result(nil)
    }
    
    private func nativeAddPushToken(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        let pushToken = call.arguments as? String ?? ""
        Affise.shared.addPushToken(pushToken: pushToken)
        result(nil)
    }
    
    private func nativeRegisterWebView(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        // TODO registerWebView
        // Affise.shared.registerWebView(webView)
        result(FlutterMethodNotImplemented)
    }
    
    private func nativeUnregisterWebView(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        Affise.shared.unregisterWebView()
        result(nil)
    }
    
    private func nativeRegisterDeeplinkCallback(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        registerCallback()
        result(nil)
    }
    
    private func nativeSetSecretId(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        let secretId = call.arguments as? String ?? ""
        Affise.shared.setSecretId(secretId: secretId)
        result(nil)
    }
    
    private func nativeSetAutoCatchingTypes(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        result(FlutterMethodNotImplemented)
    }
    
    private func nativeSetOfflineModeEnabled(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        let enabled = call.arguments as? Bool ?? false
        Affise.shared.setOfflineModeEnabled(enabled: enabled)
        result(nil)
    }
    
    private func nativeIsOfflineModeEnabled(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        result(Affise.shared.isOfflineModeEnabled())
    }
    
    private func nativeSetBackgroundTrackingEnabled(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        let enabled = call.arguments as? Bool ?? false
        Affise.shared.setBackgroundTrackingEnabled(enabled: enabled)
        result(nil)
    }
    
    private func nativeIsBackgroundTrackingEnabled(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        result(Affise.shared.isBackgroundTrackingEnabled())
    }
    
    private func nativeSetTrackingEnabled(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        let enabled = call.arguments as? Bool ?? false
        Affise.shared.setTrackingEnabled(enabled: enabled)
        result(nil)
    }
    
    private func nativeIsTrackingEnabled(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        result(Affise.shared.isTrackingEnabled())
    }
    
    private func nativeForget(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        result(FlutterMethodNotImplemented)
    }
    
    private func nativeSetEnabledMetrics(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        result(FlutterMethodNotImplemented)
    }
    
    private func nativeCrashApplication(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        result(FlutterMethodNotImplemented)
    }
    
    private func nativeGetReferrer(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        result(FlutterMethodNotImplemented)
    }

    private func nativeHandleInitialLink(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        nativeHandleDeeplink(deepLink)
        result(nil)
    }

    private func nativeSkadRegister(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        if #available(iOS 16.1, *) {
            AffiseSKAdNetwork.shared()?.updatePostbackConversionValue(0, coarseValue: "medium", completionHandler: { error in
                self.channel?.invokeMethod(self.FLUTTER_SKAD_REGISTER_ERROR, arguments: error?.localizedDescription)
            })
        } else if #available(iOS 15.4, *) {
            AffiseSKAdNetwork.shared()?.updatePostbackConversionValue(0, completionHandler: { error in
                self.channel?.invokeMethod(self.FLUTTER_SKAD_REGISTER_ERROR, arguments: error?.localizedDescription)
            })
        } else if #available(iOS 14.0, *) {
            AffiseSKAdNetwork.shared()?.registerAppForAdNetworkAttribution(completionHandler: { error in
                self.channel?.invokeMethod(self.FLUTTER_SKAD_REGISTER_ERROR, arguments: error?.localizedDescription)
            })
        } else {
            result(FlutterMethodNotImplemented)
            return
        }
        
        result(nil)
    }

    private func nativeSkadPostback(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        let map = call.arguments as? [String: Any?]
        let coarseValue = map?["coarseValue"] as? String
        
        if let fineValue = map?["fineValue"] as? Int {
            if #available(iOS 16.1, *) {
                AffiseSKAdNetwork.shared()?.updatePostbackConversionValue(fineValue, coarseValue: coarseValue ?? "medium", completionHandler: { error in
                    self.channel?.invokeMethod(self.FLUTTER_SKAD_POSTBACK_ERROR, arguments: error?.localizedDescription)
                })
            } else if #available(iOS 15.4, *) {
                AffiseSKAdNetwork.shared()?.updatePostbackConversionValue(fineValue, completionHandler: { error in
                    self.channel?.invokeMethod(self.FLUTTER_SKAD_POSTBACK_ERROR, arguments: error?.localizedDescription)
                })
            } else if #available(iOS 14.0, *) {
                AffiseSKAdNetwork.shared()?.updateConversionValue(fineValue, completionHandler: { error in
                    self.channel?.invokeMethod(self.FLUTTER_SKAD_POSTBACK_ERROR, arguments: error?.localizedDescription)
                })
            } else {
                result(FlutterMethodNotImplemented)
                return
            }
        }
        result(nil)
    }

    private func registerCallback() {
        Affise.shared.registerDeeplinkCallback {url in
        }
    }

    func nativeHandleDeeplink(_ url: String?) {
        if let url = url, !url.isEmpty {
            Affise._crossPlatform.handleDeeplink(uri: url)
            channel?.invokeMethod(FLUTTER_DEEPLINK_CALLBACK, arguments: url)
        }
    }
}
