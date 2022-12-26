package com.affise.attribution.affise_attribution_lib.factories

import com.affise.attribution.events.Event
import com.affise.attribution.events.predefined.*
import com.affise.attribution.events.subscription.SubscriptionParameters
import com.affise.attribution.affise_attribution_lib.ext.toTouchType


class AffiseEvensFactory : AffiseBaseEvensFactory() {

    private val subscriptionEventsFactory = AffiseSubtypeEventsFactory();

    override fun event(map: Map<*, *>?): Event? {
        return when (map?.get(KEY_NAME)) {
            "AchieveLevel" -> eventAchieveLevelEvent(map)
            "AddPaymentInfo" -> eventAddPaymentInfoEvent(map)
            "AddToCart" -> eventAddToCartEvent(map)
            "AddToWishlist" -> eventAddToWishlistEvent(map)
            "ClickAdv" -> eventClickAdv(map)
            "CompleteRegistration" -> eventCompleteRegistrationEvent(map)
            "CompleteStream" -> eventCompleteStreamEvent(map)
            "CompleteTrial" -> eventCompleteTrialEvent(map)
            "CompleteTutorial" -> eventCompleteTutorialEvent(map)
            "ContentItemsView" -> eventContentItemsViewEvent(map)
            "CustomId01" -> eventCustomId01Event(map)
            "CustomId02" -> eventCustomId02Event(map)
            "CustomId03" -> eventCustomId03Event(map)
            "CustomId04" -> eventCustomId04Event(map)
            "CustomId05" -> eventCustomId05Event(map)
            "CustomId06" -> eventCustomId06Event(map)
            "CustomId07" -> eventCustomId07Event(map)
            "CustomId08" -> eventCustomId08Event(map)
            "CustomId09" -> eventCustomId09Event(map)
            "CustomId10" -> eventCustomId10Event(map)
            "DeepLinked" -> eventDeepLinkedEvent(map)
            "InitiatePurchase" -> eventInitiatePurchaseEvent(map)
            "InitiateStream" -> eventInitiateStreamEvent(map)
            "Invite" -> eventInviteEvent(map)
            "LastAttributedTouch" -> eventLastAttributedTouchEvent(map)
            "ListView" -> eventListViewEvent(map)
            "Login" -> eventLoginEvent(map)
            "OpenedFromPushNotification" -> eventOpenedFromPushNotificationEvent(map)
            "Purchase" -> eventPurchaseEvent(map)
            "Rate" -> eventRateEvent(map)
            "ReEngage" -> eventReEngageEvent(map)
            "Reserve" -> eventReserveEvent(map)
            "Sales" -> eventSalesEvent(map)
            "Search" -> eventSearchEvent(map)
            "Share" -> eventShareEvent(map)
            "SpendCredits" -> eventSpendCreditsEvent(map)
            "StartRegistration" -> eventStartRegistrationEvent(map)
            "StartTrial" -> eventStartTrialEvent(map)
            "StartTutorial" -> eventStartTutorialEvent(map)
            "Subscribe" -> eventSubscribeEvent(map)
            "TravelBooking" -> eventTravelBookingEvent(map)
            "UnlockAchievement" -> eventUnlockAchievementEvent(map)
            "Unsubscribe" -> eventUnsubscribeEvent(map)
            "Update" -> eventUpdateEvent(map)
            "ViewAdv" -> eventViewAdvEvent(map)
            "ViewCart" -> eventViewCartEvent(map)
            "ViewItem" -> eventViewItemEvent(map)
            "ViewItems" -> eventViewItemsEvent(map)
            SubscriptionParameters.AFFISE_SUBSCRIPTION_ACTIVATION,
            SubscriptionParameters.AFFISE_SUBSCRIPTION_CANCELLATION,
            SubscriptionParameters.AFFISE_SUBSCRIPTION_ENTERED_BILLING_RETRY,
            SubscriptionParameters.AFFISE_SUBSCRIPTION_FIRST_CONVERSION,
            SubscriptionParameters.AFFISE_SUBSCRIPTION_REACTIVATION,
            SubscriptionParameters.AFFISE_SUBSCRIPTION_RENEWAL,
            SubscriptionParameters.AFFISE_SUBSCRIPTION_RENEWAL_FROM_BILLING_RETRY -> subscriptionEventsFactory.event(map)
            else -> null
        }
    }

    private fun eventAchieveLevelEvent(map: Map<*, *>): AchieveLevelEvent {
        val (timeStamp, userData) = getUserDataAndTimeStamp(
            map,
            "affise_event_achieve_level_timestamp"
        )
        val level = getJSONObject(map, "affise_event_achieve_level")        

        return AchieveLevelEvent(
            level,
            timeStamp,
            userData
        ).apply {
            addPredefinedParameters(this, map)
        }
    }

    private fun eventAddPaymentInfoEvent(map: Map<*, *>): AddPaymentInfoEvent {
        val (timeStamp, userData) = getUserDataAndTimeStamp(
            map,
            "affise_event_add_payment_info_timestamp"
        )
        val paymentInfo = getJSONObject(map, "affise_event_add_payment_info")        

        return AddPaymentInfoEvent(
            paymentInfo,
            timeStamp,
            userData
        ).apply {
            addPredefinedParameters(this, map)
        }
    }

    private fun eventAddToCartEvent(map: Map<*, *>): AddToCartEvent {
        val (timeStamp, userData) = getUserDataAndTimeStamp(
            map,
            "affise_event_add_to_cart_timestamp"
        )
        val addToCartObject = getJSONObjectOrNull(map, "affise_event_add_to_cart")        

        return AddToCartEvent(
            addToCartObject,
            timeStamp,
            userData
        ).apply {
            addPredefinedParameters(this, map)
        }
    }

    private fun eventAddToWishlistEvent(map: Map<*, *>): AddToWishlistEvent {
        val (timeStamp, userData) = getUserDataAndTimeStamp(
            map,
            "affise_event_add_to_wishlist_timestamp"
        )
        val wishList = getJSONObject(map, "affise_event_add_to_wishlist")        

        return AddToWishlistEvent(
            wishList,
            timeStamp,
            userData
        ).apply {
            addPredefinedParameters(this, map)
        }
    }

    private fun eventClickAdv(map: Map<*, *>): ClickAdvEvent {
        val (timeStamp, userData) = getUserDataAndTimeStamp(
            map,
            "affise_event_click_adv_timestamp"
        )
        val advertisement = getSerializeString(map, "affise_event_click_adv")

        return ClickAdvEvent(
            advertisement,
            timeStamp,
            userData,
        ).apply {
            addPredefinedParameters(this, map)
        }
    }

    private fun eventCompleteRegistrationEvent(map: Map<*, *>): CompleteRegistrationEvent {
        val (timeStamp, userData) = getUserDataAndTimeStamp(
            map,
            "affise_event_complete_registration_timestamp"
        )
        val registration = getJSONObject(map, "affise_event_complete_registration")        

        return CompleteRegistrationEvent(
            registration,
            timeStamp,
            userData,
        ).apply {
            addPredefinedParameters(this, map)
        }
    }

    private fun eventCompleteStreamEvent(map: Map<*, *>): CompleteStreamEvent {
        val (timeStamp, userData) = getUserDataAndTimeStamp(
            map,
            "affise_event_complete_stream_timestamp"
        )
        val stream = getJSONObject(map, "affise_event_complete_stream")        

        return CompleteStreamEvent(
            stream,
            timeStamp,
            userData,
        ).apply {
            addPredefinedParameters(this, map)
        }
    }

    private fun eventCompleteTrialEvent(map: Map<*, *>): CompleteTrialEvent {
        val (timeStamp, userData) = getUserDataAndTimeStamp(
            map,
            "affise_event_complete_trial_timestamp"
        )
        val trial = getJSONObject(map, "affise_event_complete_trial")        

        return CompleteTrialEvent(
            trial,
            timeStamp,
            userData,
        ).apply {
            addPredefinedParameters(this, map)
        }
    }

    private fun eventCompleteTutorialEvent(map: Map<*, *>): CompleteTutorialEvent {
        val (timeStamp, userData) = getUserDataAndTimeStamp(
            map,
            "affise_event_complete_tutorial_timestamp"
        )
        val tutorial = getJSONObject(map, "affise_event_complete_tutorial")        

        return CompleteTutorialEvent(
            tutorial,
            timeStamp,
            userData,
        ).apply {
            addPredefinedParameters(this, map)
        }
    }

    private fun eventContentItemsViewEvent(map: Map<*, *>): ContentItemsViewEvent {
        val userData = getUserData(map)
        val objects = getJsonList(map, "affise_event_content_items_view")        

        return ContentItemsViewEvent(
            objects,
            userData,
        ).apply {
            addPredefinedParameters(this, map)
        }
    }

    private fun eventCustomId01Event(map: Map<*, *>): CustomId01Event {
        val (timeStamp, userData) = getUserDataAndTimeStamp(
            map,
            "affise_event_custom_id_01_timestamp"
        )
        val custom = getSerializeString(map, "affise_event_custom_id_01")        

        return CustomId01Event(
            custom,
            timeStamp,
            userData,
        ).apply {
            addPredefinedParameters(this, map)
        }
    }

    private fun eventCustomId02Event(map: Map<*, *>): CustomId02Event {
        val (timeStamp, userData) = getUserDataAndTimeStamp(
            map,
            "affise_event_custom_id_02_timestamp"
        )
        val custom = getSerializeString(map, "affise_event_custom_id_02")        

        return CustomId02Event(
            custom,
            timeStamp,
            userData,
        ).apply {
            addPredefinedParameters(this, map)
        }
    }

    private fun eventCustomId03Event(map: Map<*, *>): CustomId03Event {
        val (timeStamp, userData) = getUserDataAndTimeStamp(
            map,
            "affise_event_custom_id_03_timestamp"
        )
        val custom = getSerializeString(map, "affise_event_custom_id_03")        

        return CustomId03Event(
            custom,
            timeStamp,
            userData,
        ).apply {
            addPredefinedParameters(this, map)
        }
    }

    private fun eventCustomId04Event(map: Map<*, *>): CustomId04Event {
        val (timeStamp, userData) = getUserDataAndTimeStamp(
            map,
            "affise_event_custom_id_04_timestamp"
        )
        val custom = getSerializeString(map, "affise_event_custom_id_04")        

        return CustomId04Event(
            custom,
            timeStamp,
            userData,
        ).apply {
            addPredefinedParameters(this, map)
        }
    }

    private fun eventCustomId05Event(map: Map<*, *>): CustomId05Event {
        val (timeStamp, userData) = getUserDataAndTimeStamp(
            map,
            "affise_event_custom_id_05_timestamp"
        )
        val custom = getSerializeString(map, "affise_event_custom_id_05")        

        return CustomId05Event(
            custom,
            timeStamp,
            userData,
        ).apply {
            addPredefinedParameters(this, map)
        }
    }

    private fun eventCustomId06Event(map: Map<*, *>): CustomId06Event {
        val (timeStamp, userData) = getUserDataAndTimeStamp(
            map,
            "affise_event_custom_id_06_timestamp"
        )
        val custom = getSerializeString(map, "affise_event_custom_id_06")        

        return CustomId06Event(
            custom,
            timeStamp,
            userData,
        ).apply {
            addPredefinedParameters(this, map)
        }
    }

    private fun eventCustomId07Event(map: Map<*, *>): CustomId07Event {
        val (timeStamp, userData) = getUserDataAndTimeStamp(
            map,
            "affise_event_custom_id_07_timestamp"
        )
        val custom = getSerializeString(map, "affise_event_custom_id_07")        

        return CustomId07Event(
            custom,
            timeStamp,
            userData,
        ).apply {
            addPredefinedParameters(this, map)
        }
    }

    private fun eventCustomId08Event(map: Map<*, *>): CustomId08Event {
        val (timeStamp, userData) = getUserDataAndTimeStamp(
            map,
            "affise_event_custom_id_08_timestamp"
        )
        val custom = getSerializeString(map, "affise_event_custom_id_08")        

        return CustomId08Event(
            custom,
            timeStamp,
            userData,
        ).apply {
            addPredefinedParameters(this, map)
        }
    }

    private fun eventCustomId09Event(map: Map<*, *>): CustomId09Event {
        val (timeStamp, userData) = getUserDataAndTimeStamp(
            map,
            "affise_event_custom_id_09_timestamp"
        )
        val custom = getSerializeString(map, "affise_event_custom_id_09")        

        return CustomId09Event(
            custom,
            timeStamp,
            userData,
        ).apply {
            addPredefinedParameters(this, map)
        }
    }

    private fun eventCustomId10Event(map: Map<*, *>): CustomId10Event {
        val (timeStamp, userData) = getUserDataAndTimeStamp(
            map,
            "affise_event_custom_id_10_timestamp"
        )
        val custom = getSerializeString(map, "affise_event_custom_id_10")        

        return CustomId10Event(
            custom,
            timeStamp,
            userData,
        ).apply {
            addPredefinedParameters(this, map)
        }
    }

    private fun eventDeepLinkedEvent(map: Map<*, *>): DeepLinkedEvent {
        val userData = getUserData(map)
        val isLinked = getSerializeString(map, "affise_event_deep_linked").toBoolean()        

        return DeepLinkedEvent(
            isLinked,
            userData,
        ).apply {
            addPredefinedParameters(this, map)
        }
    }

    private fun eventInitiatePurchaseEvent(map: Map<*, *>): InitiatePurchaseEvent {
        val (timeStamp, userData) = getUserDataAndTimeStamp(
            map,
            "affise_event_initiate_purchase_timestamp"
        )
        val purchaseData = getJSONObject(map, "affise_event_initiate_purchase")        

        return InitiatePurchaseEvent(
            purchaseData,
            timeStamp,
            userData,
        ).apply {
            addPredefinedParameters(this, map)
        }
    }

    private fun eventInitiateStreamEvent(map: Map<*, *>): InitiateStreamEvent {
        val (timeStamp, userData) = getUserDataAndTimeStamp(
            map,
            "affise_event_initiate_stream_timestamp"
        )
        val stream = getJSONObject(map, "affise_event_initiate_stream")        

        return InitiateStreamEvent(
            stream,
            timeStamp,
            userData,
        ).apply {
            addPredefinedParameters(this, map)
        }
    }

    private fun eventInviteEvent(map: Map<*, *>): InviteEvent {
        val (timeStamp, userData) = getUserDataAndTimeStamp(
            map,
            "affise_event_invite_timestamp"
        )
        val invite = getJSONObject(map, "affise_event_invite")        

        return InviteEvent(
            invite,
            timeStamp,
            userData,
        ).apply {
            addPredefinedParameters(this, map)
        }
    }

    private fun eventLastAttributedTouchEvent(map: Map<*, *>): LastAttributedTouchEvent {
        val (timeStamp, userData) = getUserDataAndTimeStamp(map, "affise_event_last_attributed_touch_timestamp")
        val touchType = getSerializeString(map, "affise_event_last_attributed_touch_type").toTouchType() ?: TouchType.CLICK
        val touchData = getJSONObject(map, "affise_event_last_attributed_touch_data")

        return LastAttributedTouchEvent(
            touchType,
            timeStamp,
            touchData,
            userData,
        ).apply {
            addPredefinedParameters(this, map)
        }
    }

    private fun eventListViewEvent(map: Map<*, *>): ListViewEvent {
        val userData = getUserData(map)
        val list = getJSONObject(map, "affise_event_list_view")        

        return ListViewEvent(
            list,
            userData,
        ).apply {
            addPredefinedParameters(this, map)
        }
    }

    private fun eventLoginEvent(map: Map<*, *>): LoginEvent {
        val (timeStamp, userData) = getUserDataAndTimeStamp(
            map,
            "affise_event_login_timestamp"
        )
        val login = getJSONObject(map, "affise_event_login")        

        return LoginEvent(
            login,
            timeStamp,
            userData,
        ).apply {
            addPredefinedParameters(this, map)
        }
    }

    private fun eventOpenedFromPushNotificationEvent(map: Map<*, *>): OpenedFromPushNotificationEvent {
        val userData = getUserData(map)
        val details = getSerializeString(map, "affise_event_opened_from_push_notification")        

        return OpenedFromPushNotificationEvent(
            details,
            userData,
        ).apply {
            addPredefinedParameters(this, map)
        }
    }

    private fun eventPurchaseEvent(map: Map<*, *>): PurchaseEvent {
        val (timeStamp, userData) = getUserDataAndTimeStamp(
            map,
            "affise_event_purchase_timestamp"
        )
        val purchaseData = getJSONObject(map, "affise_event_purchase")        

        return PurchaseEvent(
            purchaseData,
            timeStamp,
            userData,
        ).apply {
            addPredefinedParameters(this, map)
        }
    }

    private fun eventRateEvent(map: Map<*, *>): RateEvent {
        val (timeStamp, userData) = getUserDataAndTimeStamp(map, "affise_event_rate_timestamp")
        val rate = getJSONObject(map, "affise_event_rate")        

        return RateEvent(
            rate,
            timeStamp,
            userData,
        ).apply {
            addPredefinedParameters(this, map)
        }
    }

    private fun eventReEngageEvent(map: Map<*, *>): ReEngageEvent {
        val userData = getUserData(map)
        val reEngage = getSerializeString(map, "affise_event_re_engage")        

        return ReEngageEvent(
            reEngage,
            userData,
        ).apply {
            addPredefinedParameters(this, map)
        }
    }

    private fun eventReserveEvent(map: Map<*, *>): ReserveEvent {
        val (timeStamp, userData) = getUserDataAndTimeStamp(
            map,
            "affise_event_reserve_timestamp"
        )
        val reserve = getJsonList(map, "affise_event_reserve")        

        return ReserveEvent(
            reserve,
            timeStamp,
            userData,
        ).apply {
            addPredefinedParameters(this, map)
        }
    }

    private fun eventSalesEvent(map: Map<*, *>): SalesEvent {
        val (timeStamp, userData) = getUserDataAndTimeStamp(
            map,
            "affise_event_sales_timestamp"
        )
        val salesData = getJSONObject(map, "affise_event_sales")        

        return SalesEvent(
            salesData,
            timeStamp,
            userData,
        ).apply {
            addPredefinedParameters(this, map)
        }
    }

    private fun eventSearchEvent(map: Map<*, *>): SearchEvent {
        val (timeStamp, userData) = getUserDataAndTimeStamp(
            map,
            "affise_event_search_timestamp"
        )
        val search = getJSONArray(map, "affise_event_search")

        return SearchEvent(
            search,
            timeStamp,
            userData,
        ).apply {
            addPredefinedParameters(this, map)
        }
    }

    private fun eventShareEvent(map: Map<*, *>): ShareEvent {
        val (timeStamp, userData) = getUserDataAndTimeStamp(
            map,
            "affise_event_share_timestamp"
        )
        val share = getJSONObject(map, "affise_event_share")        

        return ShareEvent(
            share,
            timeStamp,
            userData,
        ).apply {
            addPredefinedParameters(this, map)
        }
    }

    private fun eventSpendCreditsEvent(map: Map<*, *>): SpendCreditsEvent {
        val (timeStamp, userData) = getUserDataAndTimeStamp(
            map,
            "affise_event_spend_credits_timestamp"
        )
        val credits = getSerializeString(map, "affise_event_spend_credits").toLong()        

        return SpendCreditsEvent(
            credits,
            timeStamp,
            userData,
        ).apply {
            addPredefinedParameters(this, map)
        }
    }

    private fun eventStartRegistrationEvent(map: Map<*, *>): StartRegistrationEvent {
        val (timeStamp, userData) = getUserDataAndTimeStamp(
            map,
            "affise_event_start_registration_timestamp"
        )
        val registration = getJSONObject(map, "affise_event_start_registration")        

        return StartRegistrationEvent(
            registration,
            timeStamp,
            userData,
        ).apply {
            addPredefinedParameters(this, map)
        }
    }

    private fun eventStartTrialEvent(map: Map<*, *>): StartTrialEvent {
        val (timeStamp, userData) = getUserDataAndTimeStamp(
            map,
            "affise_event_start_trial_timestamp"
        )
        val trial = getJSONObject(map, "affise_event_start_trial")        

        return StartTrialEvent(
            trial,
            timeStamp,
            userData,
        ).apply {
            addPredefinedParameters(this, map)
        }
    }

    private fun eventStartTutorialEvent(map: Map<*, *>): StartTutorialEvent {
        val (timeStamp, userData) = getUserDataAndTimeStamp(
            map,
            "affise_event_start_tutorial_timestamp"
        )
        val tutorial = getJSONObject(map, "affise_event_start_tutorial")        

        return StartTutorialEvent(
            tutorial,
            timeStamp,
            userData,
        ).apply {
            addPredefinedParameters(this, map)
        }
    }

    private fun eventSubscribeEvent(map: Map<*, *>): SubscribeEvent {
        val (timeStamp, userData) = getUserDataAndTimeStamp(
            map,
            "affise_event_subscribe_timestamp"
        )
        val subscribe = getJSONObject(map, "affise_event_subscribe")        

        return SubscribeEvent(
            subscribe,
            timeStamp,
            userData,
        ).apply {
            addPredefinedParameters(this, map)
        }
    }

    private fun eventTravelBookingEvent(map: Map<*, *>): TravelBookingEvent {
        val userData = getUserData(map)
        val details = getJSONArray(map, "affise_event_travel_booking")

        return TravelBookingEvent(
            details,
            userData,
        ).apply {
            addPredefinedParameters(this, map)
        }
    }

    private fun eventUnlockAchievementEvent(map: Map<*, *>): UnlockAchievementEvent {
        val (timeStamp, userData) = getUserDataAndTimeStamp(
            map,
            "affise_event_unlock_achievement_timestamp"
        )
        val achievement = getJSONObject(map, "affise_event_unlock_achievement")        

        return UnlockAchievementEvent(
            achievement,
            timeStamp,
            userData,
        ).apply {
            addPredefinedParameters(this, map)
        }
    }

    private fun eventUnsubscribeEvent(map: Map<*, *>): UnsubscribeEvent {
        val (timeStamp, userData) = getUserDataAndTimeStamp(
            map,
            "affise_event_unsubscribe_timestamp"
        )
        val unsubscribe = getJSONObject(map, "affise_event_unsubscribe")        

        return UnsubscribeEvent(
            unsubscribe,
            timeStamp,
            userData,
        ).apply {
            addPredefinedParameters(this, map)
        }
    }

    private fun eventUpdateEvent(map: Map<*, *>): UpdateEvent {
        val userData = getUserData(map)
        val details = getJSONArray(map, "affise_event_update")

        return UpdateEvent(
            details,
            userData,
        ).apply {
            addPredefinedParameters(this, map)
        }
    }

    private fun eventViewAdvEvent(map: Map<*, *>): ViewAdvEvent {
        val (timeStamp, userData) = getUserDataAndTimeStamp(
            map,
            "affise_event_view_adv_timestamp"
        )
        val ad = getJSONObject(map, "affise_event_view_adv")        

        return ViewAdvEvent(
            ad,
            timeStamp,
            userData,
        ).apply {
            addPredefinedParameters(this, map)
        }
    }

    private fun eventViewCartEvent(map: Map<*, *>): ViewCartEvent {
        val userData = getUserData(map)
        val objects = getJSONObject(map, "affise_event_view_cart")        

        return ViewCartEvent(
            objects,
            userData,
        ).apply {
            addPredefinedParameters(this, map)
        }
    }

    private fun eventViewItemEvent(map: Map<*, *>): ViewItemEvent {
        val userData = getUserData(map)
        val item = getJSONObject(map, "affise_event_view_item")        

        return ViewItemEvent(
            item,
            userData,
        ).apply {
            addPredefinedParameters(this, map)
        }
    }

    private fun eventViewItemsEvent(map: Map<*, *>): ViewItemsEvent {
        val userData = getUserData(map)
        val items = getJSONArray(map, "affise_event_view_items")

        return ViewItemsEvent(
            items,
            userData,
        ).apply {
            addPredefinedParameters(this, map)
        }
    }
}