package com.affise.attribution.affise_attribution_lib.ext

import com.affise.attribution.init.AffiseFlag


fun String.toAffiseFlag(): AffiseFlag? {
    return when (this) {
        "IOS_REQUEST_ADID" -> AffiseFlag.IOS_REQUEST_ADID
        else -> null
    }
}