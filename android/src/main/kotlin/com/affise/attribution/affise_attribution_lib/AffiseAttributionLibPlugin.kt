package com.affise.attribution.affise_attribution_lib


import android.app.Application
import android.content.Intent
import android.os.Handler
import android.os.Looper
import com.affise.attribution.internal.AffiseApiMethod
import com.affise.attribution.internal.AffiseApiWrapper
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry


/** AffiseAttributionPlugin */
class AffiseAttributionLibPlugin :
    FlutterPlugin,
    MethodCallHandler,
    ActivityAware,
    PluginRegistry.NewIntentListener {

    companion object {
        private const val CHANNEL = "affise_sdk/api"
    }

    private var channel: MethodChannel? = null
    private var apiWrapper: AffiseApiWrapper? = null
    private val handler: Handler = Handler(Looper.getMainLooper())

    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, CHANNEL)
        channel?.setMethodCallHandler(this)

        apiWrapper = AffiseApiWrapper(flutterPluginBinding.applicationContext as? Application)
        apiWrapper?.flutter()
        apiWrapper?.setCallback { name, map ->
            handler.post {
                channel?.invokeMethod(name, map)
            }
        }
    }

    override fun onMethodCall(call: MethodCall, result: Result) {
        val data = call.arguments as? Map<String, *>
        if (data == null) {
            result.error("no data", null, null)
            return
        }
        apiWrapper?.call(AffiseApiMethod.from(call.method), data, ResultWrapper(result))
    }

    private fun handleIntent(intent: Intent) {
        if (intent.action != Intent.ACTION_VIEW) return
        apiWrapper?.handleDeeplink(intent.dataString)
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel?.setMethodCallHandler(null)
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        binding.addOnNewIntentListener(this)
        handleIntent(binding.activity.intent)
    }

    override fun onNewIntent(intent: Intent): Boolean {
        handleIntent(intent)
        return false
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        binding.addOnNewIntentListener(this)
    }

    override fun onDetachedFromActivityForConfigChanges() = Unit

    override fun onDetachedFromActivity() = Unit
}
