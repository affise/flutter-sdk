package com.affise.attribution.affise_attribution_lib


import android.content.Context
import android.content.Intent
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry


/** AffiseAttributionPlugin */
class AffiseAttributionLibPlugin : FlutterPlugin, MethodCallHandler, ActivityAware, PluginRegistry.NewIntentListener {

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

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        binding.addOnNewIntentListener(this)
        wrapper.applicationContext?.let {
            this.handleIntent(it, binding.activity.intent)
        }
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        binding.addOnNewIntentListener(this)
    }

    override fun onDetachedFromActivityForConfigChanges() = Unit

    override fun onDetachedFromActivity() = Unit

    private fun handleIntent(context: Context, intent: Intent) {
        if (intent.action == Intent.ACTION_VIEW) {
            if (wrapper.initialLink == null) {
                wrapper.initialLink = intent.dataString
            }
            wrapper.nativeHandleDeeplink(intent.dataString)
        }
    }

    override fun onNewIntent(intent: Intent): Boolean {
        wrapper.applicationContext?.let {
            this.handleIntent(it, intent)
        }
        return false
    }
}
