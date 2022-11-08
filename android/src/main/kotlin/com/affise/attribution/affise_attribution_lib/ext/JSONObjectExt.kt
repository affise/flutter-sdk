package com.affise.attribution.affise_attribution_lib.ext

import android.util.Log
import org.json.JSONObject

fun Map<*,*>?.toJSONObject(): JSONObject? {
    return this?.let {
        try {
            JSONObject(it)
        } catch (e: Exception) {
            Log.d("JSONObjectExt", e.stackTraceToString())
            null
        }
    }
}