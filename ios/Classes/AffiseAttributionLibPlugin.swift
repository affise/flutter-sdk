import Flutter
import UIKit
import AffiseInternal


public class AffiseAttributionLibPlugin: NSObject, FlutterPlugin, FlutterStreamHandler {
    
    static let CHANNEL = "affise_sdk/api"
    static let EVENTS_CHANNEL = "affise_sdk/api_events"

    private var apiWrapper: AffiseApiWrapper? = nil
    private var channel: FlutterMethodChannel? = nil
    private var events: FlutterEventSink?
    private var app: UIApplication? = nil
    private var launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil
    private var initialLink: String? = nil
    
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: CHANNEL, binaryMessenger: registrar.messenger())
        let eventChannel = FlutterEventChannel(name: EVENTS_CHANNEL, binaryMessenger: registrar.messenger())
        let instance = AffiseAttributionLibPlugin()
        instance.channel = channel
        registrar.addMethodCallDelegate(instance, channel: channel)
        eventChannel.setStreamHandler(instance)
        registrar.addApplicationDelegate(instance)
    }
    
    func apiInit() {
        guard let app = app else { return }
        apiWrapper = AffiseApiWrapper(app, launchOptions: launchOptions)
        apiWrapper?.flutter()
               
        apiWrapper?.setCallback { (apiName: String, data: [String: Any?]) in
            self.channel?.invokeMethod(apiName, arguments: data)
        }
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        let apiName = call.method

        if (call.method == "initial_link") {
            handleDeeplink(initialLink)
            return
        }

        guard let api = AffiseApiMethod.from(apiName) else {
            debugPrint("error: [\(apiName)] AffiseApiMethod not found")
            return
        }
        guard let data = call.arguments as? [String: Any?] else {
            debugPrint("error: [\(apiName)] AffiseApiMethod no data found")
            return
        }
        
        apiWrapper?.call(api, map: data, result: ResultWrapper(result))
    }

    func handleDeeplink(_ url: URL?) {
        guard let link = url?.absoluteString else { return }
        handleDeeplink(link)

    }
    func handleDeeplink(_ url: String?) {
        if url.isNullOrBlank { return }
        apiWrapper?.handleDeeplink(url)
        initialLink = url
        
        // TODO 1.6.34 internal utils
        let value = URL(string: url!).toDeeplinkValue()
        events?([
            AffiseApiMethod.REGISTER_DEEPLINK_CALLBACK.method : value
        ])
//        let value = URL(string: url!).toDeeplinkValue()
//        events?([
//            AffiseApiMethod.REGISTER_DEEPLINK_CALLBACK.method : [
//                "deeplink": value.deeplink,
//                "scheme": value.scheme as Any,
//                "host": value.host as Any,
//                "path": value.path as Any,
//                "parameters": value.parameters
//            ]
//        ])
    }
    
    public func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [AnyHashable : Any] = [:]) -> Bool {
        if app == nil {
            app = application
        }
        self.launchOptions = launchOptions as? [UIApplication.LaunchOptionsKey: Any]
        apiInit()
        
        let deepLink = launchOptions[UIApplication.LaunchOptionsKey.url] as? URL
        handleDeeplink(deepLink)
        return false
    }

    public func application(_ application: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        handleDeeplink(url)
        return false
    }

    public func application(_ application: UIApplication, open url: URL, sourceApplication: String, annotation: Any) -> Bool {
        handleDeeplink(url)
        return false
    }

    public func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([Any]) -> Void) -> Bool {
        if (userActivity.activityType == NSUserActivityTypeBrowsingWeb) {
            handleDeeplink(userActivity.webpageURL)
        }
        return false
    }

    public func onListen(
        withArguments arguments: Any?,
        eventSink events: @escaping FlutterEventSink
    ) -> FlutterError? {
        self.events = events
        return nil
    }

    public func onCancel(withArguments arguments: Any?) -> FlutterError? {
        self.events = nil
        return nil
    }
}

// TODO remove for 1.6.34
extension Optional where Wrapped == URL {
    
    func toDeeplinkValue() -> [String:Any] {
        guard let self = self else {
            return [:]
        }
        
        var host: String?
        var path: String?
        var parameters: [String:[String]] = [:]
        
        if #available(iOS 16.0, *) {
#if swift(>=5.7.1)
            host = self.host(percentEncoded: false)
            path = self.path(percentEncoded: false)
#else
            host = self.host
            path = self.path
#endif
        } else {
            host = self.host
            path = self.path
        }
        
        let component = URLComponents(string: self.absoluteString)
        for item in component?.queryItems ?? [] {
            let value = item.value?.removingPercentEncoding
            if parameters[item.name] != nil {
                parameters[item.name]?.append(value ?? "")
            } else {
                parameters[item.name] = [value ?? ""]
            }
        }
        
        return [
            "deeplink": self.absoluteString,
            "scheme": self.scheme as Any,
            "host": host as Any,
            "path": path as Any,
            "parameters": parameters
        ]
    }
}
