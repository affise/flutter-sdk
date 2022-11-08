package com.affise.attribution.affise_attribution_lib.ext

import com.affise.attribution.events.predefined.PredefinedParameters

fun String.toPredefinedParameters(): PredefinedParameters? {
    return when (this) {
        "affise_p_adrev_ad_type" -> PredefinedParameters.ADREV_AD_TYPE
        "affise_p_city" -> PredefinedParameters.CITY
        "affise_p_country" -> PredefinedParameters.COUNTRY
        "affise_p_region" -> PredefinedParameters.REGION
        "affise_p_class" -> PredefinedParameters.CLASS
        "affise_p_content" -> PredefinedParameters.CONTENT
        "affise_p_content_id" -> PredefinedParameters.CONTENT_ID
        "affise_p_content_list" -> PredefinedParameters.CONTENT_LIST
        "affise_p_content_type" -> PredefinedParameters.CONTENT_TYPE
        "affise_p_currency" -> PredefinedParameters.CURRENCY
        "affise_p_customer_user_id" -> PredefinedParameters.CUSTOMER_USER_ID
        "affise_p_date_a" -> PredefinedParameters.DATE_A
        "affise_p_date_b" -> PredefinedParameters.DATE_B
        "affise_p_departing_arrival_date" -> PredefinedParameters.DEPARTING_ARRIVAL_DATE
        "affise_p_departing_departure_date" -> PredefinedParameters.DEPARTING_DEPARTURE_DATE
        "affise_p_description" -> PredefinedParameters.DESCRIPTION
        "affise_p_destination_a" -> PredefinedParameters.DESTINATION_A
        "affise_p_destination_b" -> PredefinedParameters.DESTINATION_B
        "affise_p_destination_list" -> PredefinedParameters.DESTINATION_LIST
        "affise_p_hotel_score" -> PredefinedParameters.HOTEL_SCORE
        "affise_p_level" -> PredefinedParameters.LEVEL
        "affise_p_max_rating_value" -> PredefinedParameters.MAX_RATING_VALUE
        "affise_p_num_adults" -> PredefinedParameters.NUM_ADULTS
        "affise_p_num_children" -> PredefinedParameters.NUM_CHILDREN
        "affise_p_num_infants" -> PredefinedParameters.NUM_INFANTS
        "affise_p_order_id" -> PredefinedParameters.ORDER_ID
        "affise_p_payment_info_available" -> PredefinedParameters.PAYMENT_INFO_AVAILABLE
        "affise_p_preferred_neighborhoods" -> PredefinedParameters.PREFERRED_NEIGHBORHOODS
        "affise_p_preferred_num_stops" -> PredefinedParameters.PREFERRED_NUM_STOPS
        "affise_p_preferred_price_range" -> PredefinedParameters.PREFERRED_PRICE_RANGE
        "affise_p_preferred_star_ratings" -> PredefinedParameters.PREFERRED_STAR_RATINGS
        "affise_p_price" -> PredefinedParameters.PRICE
        "affise_p_purchase_currency" -> PredefinedParameters.PURCHASE_CURRENCY
        "affise_p_quantity" -> PredefinedParameters.QUANTITY
        "affise_p_rating_value" -> PredefinedParameters.RATING_VALUE
        "affise_p_receipt_id" -> PredefinedParameters.RECEIPT_ID
        "affise_p_registration_method" -> PredefinedParameters.REGISTRATION_METHOD
        "affise_p_returning_arrival_date" -> PredefinedParameters.RETURNING_ARRIVAL_DATE
        "affise_p_returning_departure_date" -> PredefinedParameters.RETURNING_DEPARTURE_DATE
        "affise_p_revenue" -> PredefinedParameters.REVENUE
        "affise_p_score" -> PredefinedParameters.SCORE
        "affise_p_search_string" -> PredefinedParameters.SEARCH_STRING
        "affise_p_subscription_id" -> PredefinedParameters.SUBSCRIPTION_ID
        "affise_p_success" -> PredefinedParameters.SUCCESS
        "affise_p_suggested_destinations" -> PredefinedParameters.SUGGESTED_DESTINATIONS
        "affise_p_suggested_hotels" -> PredefinedParameters.SUGGESTED_HOTELS
        "affise_p_travel_start" -> PredefinedParameters.TRAVEL_START
        "affise_p_travel_end" -> PredefinedParameters.TRAVEL_END
        "affise_p_user_score" -> PredefinedParameters.USER_SCORE
        "affise_p_validated" -> PredefinedParameters.VALIDATED
        "affise_p_achievement_id" -> PredefinedParameters.ACHIEVEMENT_ID
        "affise_p_coupon_code" -> PredefinedParameters.COUPON_CODE
        "affise_p_customer_segment" -> PredefinedParameters.CUSTOMER_SEGMENT
        "affise_p_deep_link" -> PredefinedParameters.DEEP_LINK
        "affise_p_event_start" -> PredefinedParameters.EVENT_START
        "affise_p_event_end" -> PredefinedParameters.EVENT_END
        "affise_p_lat" -> PredefinedParameters.LAT
        "affise_p_long" -> PredefinedParameters.LONG
        "affise_p_new_version" -> PredefinedParameters.NEW_VERSION
        "affise_p_old_version" -> PredefinedParameters.OLD_VERSION
        "affise_p_param_01" -> PredefinedParameters.PARAM_01
        "affise_p_param_02" -> PredefinedParameters.PARAM_02
        "affise_p_param_03" -> PredefinedParameters.PARAM_03
        "affise_p_param_04" -> PredefinedParameters.PARAM_04
        "affise_p_param_05" -> PredefinedParameters.PARAM_05
        "affise_p_param_06" -> PredefinedParameters.PARAM_06
        "affise_p_param_07" -> PredefinedParameters.PARAM_07
        "affise_p_param_08" -> PredefinedParameters.PARAM_08
        "affise_p_param_09" -> PredefinedParameters.PARAM_09
        "affise_p_param_10" -> PredefinedParameters.PARAM_10
        "affise_p_review_text" -> PredefinedParameters.REVIEW_TEXT
        "affise_p_tutorial_id" -> PredefinedParameters.TUTORIAL_ID
        "affise_p_virtual_currency_name" -> PredefinedParameters.VIRTUAL_CURRENCY_NAME
        else -> null
    }
}
