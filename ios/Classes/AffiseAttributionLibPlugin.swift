import Flutter
import UIKit
import AffiseInternal


public class AffiseAttributionLibPlugin: NSObject, FlutterPlugin {
    
    static let CHANNEL = "affise_sdk/api"

    private var apiWrapper: AffiseApiWrapper? = nil
    private var channel: FlutterMethodChannel? = nil
    private var app: UIApplication? = nil
    private var launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil   
    
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: CHANNEL, binaryMessenger: registrar.messenger())
        let instance = AffiseAttributionLibPlugin()
        instance.channel = channel
        registrar.addMethodCallDelegate(instance, channel: channel)
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
        if link.isEmpty { return }
        apiWrapper?.handleDeeplink(link)
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
}
