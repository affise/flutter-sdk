package com.affise.attribution.affise_attribution_lib.ext


import com.affise.attribution.referrer.ReferrerKey


fun String.toReferrerKey(): ReferrerKey? {
    return when (this) {
        "ad_id" -> ReferrerKey.AD_ID
        "campaign_id" -> ReferrerKey.CAMPAIGN_ID
        "clickid" -> ReferrerKey.CLICK_ID
        "affise_ad" -> ReferrerKey.AFFISE_AD
        "affise_ad_id" -> ReferrerKey.AFFISE_AD_ID
        "affise_ad_type" -> ReferrerKey.AFFISE_AD_TYPE
        "affise_adset" -> ReferrerKey.AFFISE_ADSET
        "affise_adset_id" -> ReferrerKey.AFFISE_ADSET_ID
        "affise_affc_id" -> ReferrerKey.AFFISE_AFFC_ID
        "affise_channel" -> ReferrerKey.AFFISE_CHANNEL
        "affise_click_lookback" -> ReferrerKey.AFFISE_CLICK_LOOK_BACK
        "affise_cost_currency" -> ReferrerKey.AFFISE_COST_CURRENCY
        "affise_cost_model" -> ReferrerKey.AFFISE_COST_MODEL
        "affise_cost_value" -> ReferrerKey.AFFISE_COST_VALUE
        "affise_deeplink" -> ReferrerKey.AFFISE_DEEPLINK
        "affise_keywords" -> ReferrerKey.AFFISE_KEYWORDS
        "affise_media_type" -> ReferrerKey.AFFISE_MEDIA_TYPE
        "affise_model" -> ReferrerKey.AFFISE_MODEL
        "affise_os" -> ReferrerKey.AFFISE_OS
        "affise_partner" -> ReferrerKey.AFFISE_PARTNER
        "affise_ref" -> ReferrerKey.AFFISE_REF
        "affise_siteid" -> ReferrerKey.AFFISE_SITE_ID
        "affise_sub_siteid" -> ReferrerKey.AFFISE_SUB_SITE_ID
        "affc" -> ReferrerKey.AFFC
        "pid" -> ReferrerKey.PID
        "sub1" -> ReferrerKey.SUB_1
        "sub2" -> ReferrerKey.SUB_2
        "sub3" -> ReferrerKey.SUB_3
        "sub4" -> ReferrerKey.SUB_4
        "sub5" -> ReferrerKey.SUB_5
        else -> null
    }
}
