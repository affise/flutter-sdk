package com.affise.attribution.affise_attribution_lib

import android.app.Application
import android.content.Context
import com.affise.attribution.Affise
import com.affise.attribution.affise_attribution_lib.ext.*
import com.affise.attribution.affise_attribution_lib.factories.AffiseEvensFactory
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.Result

internal class AffiseWrapper {

    companion object {
        private const val AFFISE_INIT = "init"
        private const val AFFISE_SEND_EVENTS = "send_events"
        private const val AFFISE_SEND_EVENT = "send_event"
        private const val AFFISE_ADD_PUSH_TOKEN = "add_push_token"
        private const val AFFISE_REGISTER_WEB_VIEW = "register_web_view"
        private const val AFFISE_UNREGISTER_WEB_VIEW = "unregister_web_view"
        private const val AFFISE_REGISTER_DEEPLINK_CALLBACK = "register_Deeplink_Callback"
        private const val AFFISE_SET_SECRET_ID = "set_secret_id"
        private const val AFFISE_SET_AUTO_CATCHING_TYPES = "set_auto_catching_types"
        private const val AFFISE_SET_OFFLINE_MODE_ENABLED = "set_offline_mode_enabled"
        private const val AFFISE_IS_OFFLINE_MODE_ENABLED = "is_offline_mode_enabled"
        private const val AFFISE_SET_BACKGROUND_TRACKING_ENABLED = "set_background_tracking_enabled"
        private const val AFFISE_IS_BACKGROUND_TRACKING_ENABLED = "is_background_tracking_enabled"
        private const val AFFISE_SET_TRACKING_ENABLED = "set_tracking_enabled"
        private const val AFFISE_IS_TRACKING_ENABLED = "is_tracking_enabled"
        private const val AFFISE_FORGET = "forget"
        private const val AFFISE_SET_ENABLED_METRICS = "set_enabled_metrics"
        private const val AFFISE_CRASH_APPLICATION = "crash_application"
        private const val AFFISE_GET_REFERRER = "get_referrer"

        private const val FLUTTER_DEEPLINK_CALLBACK = "registerDeeplinkCallback"
    }

    var applicationContext: Context? = null
    var channel: MethodChannel? = null
    private var evensFactory: AffiseEvensFactory = AffiseEvensFactory()

    fun handle(call: MethodCall, result: Result) {
        when (call.method) {
            AFFISE_INIT -> nativeInit(call, result)
            AFFISE_SEND_EVENTS -> nativeSendEvents(call, result)
            AFFISE_SEND_EVENT -> nativeSendEvent(call, result)
            AFFISE_ADD_PUSH_TOKEN -> nativeAddPushToken(call, result)
            AFFISE_REGISTER_WEB_VIEW -> nativeRegisterWebView(call, result)
            AFFISE_UNREGISTER_WEB_VIEW -> nativeUnregisterWebView(call, result)
            AFFISE_REGISTER_DEEPLINK_CALLBACK -> nativeRegisterDeeplinkCallback(call, result)
            AFFISE_SET_SECRET_ID -> nativeSetSecretId(call, result)
            AFFISE_SET_AUTO_CATCHING_TYPES -> nativeSetAutoCatchingTypes(call, result)
            AFFISE_SET_OFFLINE_MODE_ENABLED -> nativeSetOfflineModeEnabled(call, result)
            AFFISE_IS_OFFLINE_MODE_ENABLED -> nativeIsOfflineModeEnabled(call, result)
            AFFISE_SET_BACKGROUND_TRACKING_ENABLED -> nativeSetBackgroundTrackingEnabled(call, result)
            AFFISE_IS_BACKGROUND_TRACKING_ENABLED -> nativeIsBackgroundTrackingEnabled(call, result)
            AFFISE_SET_TRACKING_ENABLED -> nativeSetTrackingEnabled(call, result)
            AFFISE_IS_TRACKING_ENABLED -> nativeIsTrackingEnabled(call, result)
            AFFISE_FORGET -> nativeForget(call, result)
            AFFISE_SET_ENABLED_METRICS -> nativeSetEnabledMetrics(call, result)
            AFFISE_CRASH_APPLICATION -> nativeCrashApplication(call, result)
            AFFISE_GET_REFERRER -> nativeGetReferrer(call, result)
            else -> {
                result.notImplemented()
            }
        }
    }

    private fun nativeInit(call: MethodCall, result: Result) {
        val map = call.argumentMap()
        (applicationContext as? Application)?.let { application ->
            try {
                map?.toAffiseInitProperties()?.let { properties ->
                    Affise.init(application, properties)
                    result.success(null)

                    Affise.onInitSendEvents()
                } ?: result.error("Error affise init", null, null)
            } catch (e: Exception) {
                result.error(e.message ?: "Error on Affise init", e.stackTraceToString(), null)
            }
        }
    }

    private fun nativeSendEvent(call: MethodCall, result: Result) {
        val map = call.argumentMap()
        evensFactory.event(map)?.let {
            Affise.sendEvent(it)
            result.success(null)
        } ?: result.error("Error event factory", null, null)
    }

    private fun nativeSendEvents(call: MethodCall, result: Result) {
        Affise.sendEvents()
        result.success(null)
    }

    private fun nativeAddPushToken(call: MethodCall, result: Result) {
        val pushToken = call.argumentString()
        Affise.addPushToken(pushToken)
        result.success(null)
    }

    private fun nativeRegisterWebView(call: MethodCall, result: Result) {
        result.notImplemented()
    }

    private fun nativeUnregisterWebView(call: MethodCall, result: Result) {
        Affise.unregisterWebView()
        result.success(null)
    }

    private fun nativeRegisterDeeplinkCallback(call: MethodCall, result: Result) {
        Affise.registerDeeplinkCallback {
            channel?.invokeMethod(FLUTTER_DEEPLINK_CALLBACK, it.toString())
            return@registerDeeplinkCallback true
        }
        result.success(null)
    }

    private fun nativeSetSecretId(call: MethodCall, result: Result) {
        val secretId = call.argumentString()
        Affise.setSecretId(secretId)
        result.success(null)
    }

    private fun nativeSetAutoCatchingTypes(call: MethodCall, result: Result) {
        val types = call.argumentList()?.mapNotNull {
            it.toString().toAutoCatchingType()
        }
        Affise.setAutoCatchingTypes(types)
        result.success(null)
    }

    private fun nativeSetOfflineModeEnabled(call: MethodCall, result: Result) {
        val enabled = call.argumentBoolean()
        Affise.setOfflineModeEnabled(enabled)
        result.success(null)
    }

    private fun nativeIsOfflineModeEnabled(call: MethodCall, result: Result) {
        result.success(Affise.isOfflineModeEnabled())
    }

    private fun nativeSetBackgroundTrackingEnabled(call: MethodCall, result: Result) {
        val enabled = call.argumentBoolean()
        Affise.setBackgroundTrackingEnabled(enabled)
        result.success(null)
    }

    private fun nativeIsBackgroundTrackingEnabled(call: MethodCall, result: Result) {
        result.success(Affise.isBackgroundTrackingEnabled())
    }

    private fun nativeSetTrackingEnabled(call: MethodCall, result: Result) {
        val enabled = call.argumentBoolean()
        Affise.setTrackingEnabled(enabled)
        result.success(null)
    }

    private fun nativeIsTrackingEnabled(call: MethodCall, result: Result) {
        result.success(Affise.isTrackingEnabled())
    }

    private fun nativeForget(call: MethodCall, result: Result) {
        val userData = call.argumentString()
        Affise.forget(userData)
        result.success(null)
    }

    private fun nativeSetEnabledMetrics(call: MethodCall, result: Result) {
        val enabled = call.argumentBoolean()
        Affise.setEnabledMetrics(enabled)
        result.success(null)
    }

    private fun nativeCrashApplication(call: MethodCall, result: Result) {
        Affise.crashApplication()
        result.success(null)
    }

    private fun nativeGetReferrer(call: MethodCall, result: Result) {
        result.success(Affise.getReferrer())
    }
}