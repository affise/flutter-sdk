enum PredefinedParameters {
  ADREV_AD_TYPE,
  CITY,
  COUNTRY,
  REGION,
  CLASS,
  CONTENT,
  CONTENT_ID,
  CONTENT_LIST,
  CONTENT_TYPE,
  CURRENCY,
  CUSTOMER_USER_ID,
  DATE_A,
  DATE_B,
  DEPARTING_ARRIVAL_DATE,
  DEPARTING_DEPARTURE_DATE,
  DESCRIPTION,
  DESTINATION_A,
  DESTINATION_B,
  DESTINATION_LIST,
  HOTEL_SCORE,
  LEVEL,
  MAX_RATING_VALUE,
  NUM_ADULTS,
  NUM_CHILDREN,
  NUM_INFANTS,
  ORDER_ID,
  PAYMENT_INFO_AVAILABLE,
  PREFERRED_NEIGHBORHOODS,
  PREFERRED_NUM_STOPS,
  PREFERRED_PRICE_RANGE,
  PREFERRED_STAR_RATINGS,
  PRICE,
  PURCHASE_CURRENCY,
  QUANTITY,
  RATING_VALUE,
  RECEIPT_ID,
  REGISTRATION_METHOD,
  RETURNING_ARRIVAL_DATE,
  RETURNING_DEPARTURE_DATE,
  REVENUE,
  SCORE,
  SEARCH_STRING,
  SUBSCRIPTION_ID,
  SUCCESS,
  SUGGESTED_DESTINATIONS,
  SUGGESTED_HOTELS,
  TRAVEL_START,
  TRAVEL_END,
  USER_SCORE,
  VALIDATED,
  ACHIEVEMENT_ID,
  COUPON_CODE,
  CUSTOMER_SEGMENT,
  DEEP_LINK,
  EVENT_START,
  EVENT_END,
  LAT,
  LONG,
  NEW_VERSION,
  OLD_VERSION,
  PARAM_01,
  PARAM_02,
  PARAM_03,
  PARAM_04,
  PARAM_05,
  PARAM_06,
  PARAM_07,
  PARAM_08,
  PARAM_09,
  PARAM_10,
  REVIEW_TEXT,
  TUTORIAL_ID,
  VIRTUAL_CURRENCY_NAME;
}

extension PredefinedParametersValue on PredefinedParameters {
  String get value {
    switch (this) {
      case PredefinedParameters.ADREV_AD_TYPE:
        return "affise_p_adrev_ad_type";
      case PredefinedParameters.CITY:
        return "affise_p_city";
      case PredefinedParameters.COUNTRY:
        return "affise_p_country";
      case PredefinedParameters.REGION:
        return "affise_p_region";
      case PredefinedParameters.CLASS:
        return "affise_p_class";
      case PredefinedParameters.CONTENT:
        return "affise_p_content";
      case PredefinedParameters.CONTENT_ID:
        return "affise_p_content_id";
      case PredefinedParameters.CONTENT_LIST:
        return "affise_p_content_list";
      case PredefinedParameters.CONTENT_TYPE:
        return "affise_p_content_type";
      case PredefinedParameters.CURRENCY:
        return "affise_p_currency";
      case PredefinedParameters.CUSTOMER_USER_ID:
        return "affise_p_customer_user_id";
      case PredefinedParameters.DATE_A:
        return "affise_p_date_a";
      case PredefinedParameters.DATE_B:
        return "affise_p_date_b";
      case PredefinedParameters.DEPARTING_ARRIVAL_DATE:
        return "affise_p_departing_arrival_date";
      case PredefinedParameters.DEPARTING_DEPARTURE_DATE:
        return "affise_p_departing_departure_date";
      case PredefinedParameters.DESCRIPTION:
        return "affise_p_description";
      case PredefinedParameters.DESTINATION_A:
        return "affise_p_destination_a";
      case PredefinedParameters.DESTINATION_B:
        return "affise_p_destination_b";
      case PredefinedParameters.DESTINATION_LIST:
        return "affise_p_destination_list";
      case PredefinedParameters.HOTEL_SCORE:
        return "affise_p_hotel_score";
      case PredefinedParameters.LEVEL:
        return "affise_p_level";
      case PredefinedParameters.MAX_RATING_VALUE:
        return "affise_p_max_rating_value";
      case PredefinedParameters.NUM_ADULTS:
        return "affise_p_num_adults";
      case PredefinedParameters.NUM_CHILDREN:
        return "affise_p_num_children";
      case PredefinedParameters.NUM_INFANTS:
        return "affise_p_num_infants";
      case PredefinedParameters.ORDER_ID:
        return "affise_p_order_id";
      case PredefinedParameters.PAYMENT_INFO_AVAILABLE:
        return "affise_p_payment_info_available";
      case PredefinedParameters.PREFERRED_NEIGHBORHOODS:
        return "affise_p_preferred_neighborhoods";
      case PredefinedParameters.PREFERRED_NUM_STOPS:
        return "affise_p_preferred_num_stops";
      case PredefinedParameters.PREFERRED_PRICE_RANGE:
        return "affise_p_preferred_price_range";
      case PredefinedParameters.PREFERRED_STAR_RATINGS:
        return "affise_p_preferred_star_ratings";
      case PredefinedParameters.PRICE:
        return "affise_p_price";
      case PredefinedParameters.PURCHASE_CURRENCY:
        return "affise_p_purchase_currency";
      case PredefinedParameters.QUANTITY:
        return "affise_p_quantity";
      case PredefinedParameters.RATING_VALUE:
        return "affise_p_rating_value";
      case PredefinedParameters.RECEIPT_ID:
        return "affise_p_receipt_id";
      case PredefinedParameters.REGISTRATION_METHOD:
        return "affise_p_registration_method";
      case PredefinedParameters.RETURNING_ARRIVAL_DATE:
        return "affise_p_returning_arrival_date";
      case PredefinedParameters.RETURNING_DEPARTURE_DATE:
        return "affise_p_returning_departure_date";
      case PredefinedParameters.REVENUE:
        return "affise_p_revenue";
      case PredefinedParameters.SCORE:
        return "affise_p_score";
      case PredefinedParameters.SEARCH_STRING:
        return "affise_p_search_string";
      case PredefinedParameters.SUBSCRIPTION_ID:
        return "affise_p_subscription_id";
      case PredefinedParameters.SUCCESS:
        return "affise_p_success";
      case PredefinedParameters.SUGGESTED_DESTINATIONS:
        return "affise_p_suggested_destinations";
      case PredefinedParameters.SUGGESTED_HOTELS:
        return "affise_p_suggested_hotels";
      case PredefinedParameters.TRAVEL_START:
        return "affise_p_travel_start";
      case PredefinedParameters.TRAVEL_END:
        return "affise_p_travel_end";
      case PredefinedParameters.USER_SCORE:
        return "affise_p_user_score";
      case PredefinedParameters.VALIDATED:
        return "affise_p_validated";
      case PredefinedParameters.ACHIEVEMENT_ID:
        return "affise_p_achievement_id";
      case PredefinedParameters.COUPON_CODE:
        return "affise_p_coupon_code";
      case PredefinedParameters.CUSTOMER_SEGMENT:
        return "affise_p_customer_segment";
      case PredefinedParameters.DEEP_LINK:
        return "affise_p_deep_link";
      case PredefinedParameters.EVENT_START:
        return "affise_p_event_start";
      case PredefinedParameters.EVENT_END:
        return "affise_p_event_end";
      case PredefinedParameters.LAT:
        return "affise_p_lat";
      case PredefinedParameters.LONG:
        return "affise_p_long";
      case PredefinedParameters.NEW_VERSION:
        return "affise_p_new_version";
      case PredefinedParameters.OLD_VERSION:
        return "affise_p_old_version";
      case PredefinedParameters.PARAM_01:
        return "affise_p_param_01";
      case PredefinedParameters.PARAM_02:
        return "affise_p_param_02";
      case PredefinedParameters.PARAM_03:
        return "affise_p_param_03";
      case PredefinedParameters.PARAM_04:
        return "affise_p_param_04";
      case PredefinedParameters.PARAM_05:
        return "affise_p_param_05";
      case PredefinedParameters.PARAM_06:
        return "affise_p_param_06";
      case PredefinedParameters.PARAM_07:
        return "affise_p_param_07";
      case PredefinedParameters.PARAM_08:
        return "affise_p_param_08";
      case PredefinedParameters.PARAM_09:
        return "affise_p_param_09";
      case PredefinedParameters.PARAM_10:
        return "affise_p_param_10";
      case PredefinedParameters.REVIEW_TEXT:
        return "affise_p_review_text";
      case PredefinedParameters.TUTORIAL_ID:
        return "affise_p_tutorial_id";
      case PredefinedParameters.VIRTUAL_CURRENCY_NAME:
        return "affise_p_virtual_currency_name";
      default:
        return "";
    }
  }
}
