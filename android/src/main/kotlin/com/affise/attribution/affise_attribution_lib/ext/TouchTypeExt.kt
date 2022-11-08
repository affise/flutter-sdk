package com.affise.attribution.affise_attribution_lib.ext

import com.affise.attribution.events.predefined.TouchType

fun String.toTouchType(): TouchType? {
    return when (this) {
        "CLICK" -> TouchType.CLICK
        "WEB_TO_APP_AUTO_REDIRECT" -> TouchType.WEB_TO_APP_AUTO_REDIRECT
        "IMPRESSION" -> TouchType.IMPRESSION
        else -> null
    }
}