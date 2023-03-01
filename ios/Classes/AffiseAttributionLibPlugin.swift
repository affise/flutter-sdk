import Flutter
import UIKit


public class AffiseAttributionLibPlugin: NSObject, FlutterPlugin {
    
    static let CHANNEL = "affise_sdk/api"
       
    private var wrapper: AffiseWrapper = AffiseWrapper()
    
    public func applicationWillResignActive(_ application: UIApplication) {
    }
    
    public func applicationDidBecomeActive(_ application: UIApplication) {
        if wrapper.application == nil {
            wrapper.application = application
        }
    }
    
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: CHANNEL, binaryMessenger: registrar.messenger())
        let instance = AffiseAttributionLibPlugin()
        instance.wrapper.channel = channel
        registrar.addMethodCallDelegate(instance, channel: channel)
        registrar.addApplicationDelegate(instance)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        wrapper.handle(call, result: result)
    }
    
    public func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [AnyHashable : Any] = [:]) -> Bool {
        wrapper.launchOptions = launchOptions as? [UIApplication.LaunchOptionsKey: Any]
        wrapper.deepLink = (wrapper.launchOptions?[UIApplication.LaunchOptionsKey.url] as? URL)?.absoluteString
        wrapper.nativeHandleDeeplink(wrapper.deepLink)
        return true
    }

    public func application(_ application: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        wrapper.deepLink = url.absoluteString
        wrapper.nativeHandleDeeplink(wrapper.deepLink)
        return true
    }
    
    public func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([Any]) -> Void) -> Bool {
        if (userActivity.activityType == NSUserActivityTypeBrowsingWeb) {
            wrapper.deepLink = userActivity.webpageURL?.absoluteString
            wrapper.nativeHandleDeeplink(wrapper.deepLink)
            return true
        }
        return false
    }
}
