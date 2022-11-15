import Flutter
import UIKit

public class AffiseAttributionLibPlugin: NSObject, FlutterPlugin {
    
    static let CHANNEL = "affise_sdk/api"
    
    private static var launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    
    private var wrapper: AffiseWrapper = AffiseWrapper()
    
    public func applicationWillResignActive(_ application: UIApplication) {
    }
    
    public func applicationDidBecomeActive(_ application: UIApplication) {
        if wrapper.application == nil {
            wrapper.application = application
        }
    }
    
    public static func setLaunchOptions(_ launchOptions: [UIApplication.LaunchOptionsKey: Any]?) {
        self.launchOptions = launchOptions
    }
    
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: CHANNEL, binaryMessenger: registrar.messenger())
        let instance = AffiseAttributionLibPlugin()
        instance.wrapper.channel = channel
        instance.wrapper.launchOptions = launchOptions
        registrar.addMethodCallDelegate(instance, channel: channel)
        registrar.addApplicationDelegate(instance)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        wrapper.handle(call, result: result)
    }
}
