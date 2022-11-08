package com.affise.attribution.affise_attribution_lib.ext

import com.affise.attribution.events.autoCatchingClick.AutoCatchingType


fun String.toAutoCatchingType(): AutoCatchingType? {
    return when (this) {
        "BUTTON" -> AutoCatchingType.BUTTON
        "TEXT" -> AutoCatchingType.TEXT
        "IMAGE_BUTTON" -> AutoCatchingType.IMAGE_BUTTON
        "IMAGE" -> AutoCatchingType.IMAGE
        "GROUP" -> AutoCatchingType.GROUP
        else -> null
    }
}