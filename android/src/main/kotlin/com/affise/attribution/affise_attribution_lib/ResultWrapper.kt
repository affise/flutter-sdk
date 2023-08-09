package com.affise.attribution.affise_attribution_lib

import com.affise.attribution.internal.callback.AffiseResult
import io.flutter.plugin.common.MethodChannel

class ResultWrapper(private val methodResult: MethodChannel.Result) : AffiseResult {

    override fun success(data: Any?) {
        methodResult.success(data)
    }

    override fun error(error: String) {
        methodResult.error(error, null, null)
    }

    override fun notImplemented() {
        methodResult.notImplemented()
    }
}