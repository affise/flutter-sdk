package com.affise.attribution.affise_attribution_lib


import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** AffiseAttributionPlugin */
class AffiseAttributionLibPlugin : FlutterPlugin, MethodCallHandler {

    companion object {
        private const val CHANNEL = "affise_sdk/api"
    }

    private var channel: MethodChannel? = null
    private var wrapper: AffiseWrapper = AffiseWrapper()

    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        wrapper.applicationContext = flutterPluginBinding.applicationContext
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, CHANNEL)
        channel?.setMethodCallHandler(this)
        wrapper.channel = channel
    }

    override fun onMethodCall(call: MethodCall, result: Result) {
        wrapper.handle(call = call, result = result)
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel?.setMethodCallHandler(null)
    }
}
