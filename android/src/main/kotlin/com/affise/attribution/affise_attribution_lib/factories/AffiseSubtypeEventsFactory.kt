package com.affise.attribution.affise_attribution_lib.factories

import com.affise.attribution.events.Event
import com.affise.attribution.events.subscription.*
import com.affise.attribution.affise_attribution_lib.ext.toJSONObject
import org.json.JSONObject

class AffiseSubtypeEventsFactory : AffiseBaseEvensFactory() {

    override fun event(map: Map<*, *>?): Event? {
        return when (map?.get(KEY_SUBTYPE)) {
            SubscriptionParameters.AFFISE_SUB_INITIAL_SUBSCRIPTION -> eventInitialSubscriptionEvent(map)
            SubscriptionParameters.AFFISE_SUB_INITIAL_TRIAL -> eventInitialTrialEvent(map)
            SubscriptionParameters.AFFISE_SUB_INITIAL_OFFER -> eventInitialOfferEvent(map)
            SubscriptionParameters.AFFISE_SUB_FAILED_TRIAL -> eventFailedTrialEvent(map)
            SubscriptionParameters.AFFISE_SUB_FAILED_OFFERISE -> eventFailedOfferiseEvent(map)
            SubscriptionParameters.AFFISE_SUB_FAILED_SUBSCRIPTION -> eventFailedSubscriptionEvent(map)
            SubscriptionParameters.AFFISE_SUB_FAILED_TRIAL_FROM_RETRY -> eventFailedTrialFromRetryEvent(map)
            SubscriptionParameters.AFFISE_SUB_FAILED_OFFER_FROM_RETRY -> eventFailedOfferFromRetryEvent(map)
            SubscriptionParameters.AFFISE_SUB_FAILED_SUBSCRIPTION_FROM_RETRY -> eventFailedSubscriptionFromRetryEvent(map)
            SubscriptionParameters.AFFISE_SUB_TRIAL_IN_RETRY -> eventTrialInRetryEvent(map)
            SubscriptionParameters.AFFISE_SUB_OFFER_IN_RETRY -> eventOfferInRetryEvent(map)
            SubscriptionParameters.AFFISE_SUB_SUBSCRIPTION_IN_RETRY -> eventSubscriptionInRetryEvent(map)
            SubscriptionParameters.AFFISE_SUB_CONVERTED_TRIAL -> eventConvertedTrialEvent(map)
            SubscriptionParameters.AFFISE_SUB_CONVERTED_OFFER -> eventConvertedOfferEvent(map)
            SubscriptionParameters.AFFISE_SUB_REACTIVATED_SUBSCRIPTION -> eventReactivatedSubscriptionEvent(map)
            SubscriptionParameters.AFFISE_SUB_RENEWED_SUBSCRIPTION -> eventRenewedSubscriptionEvent(map)
            SubscriptionParameters.AFFISE_SUB_CONVERTED_TRIAL_FROM_RETRY -> eventConvertedTrialFromRetryEvent(map)
            SubscriptionParameters.AFFISE_SUB_CONVERTED_OFFER_FROM_RETRY -> eventConvertedOfferFromRetryEvent(map)
            SubscriptionParameters.AFFISE_SUB_RENEWED_SUBSCRIPTION_FROM_RETRY -> eventRenewedSubscriptionFromRetryEvent(map)
            else -> null
        }
    }

    private fun getDataJSONObject(map: Map<*, *>): JSONObject {
        return (map[KEY_DATA] as? Map<*, *>)?.toJSONObject() ?: JSONObject()
    }

    private fun eventInitialSubscriptionEvent(map: Map<*, *>): InitialSubscriptionEvent {
        val userData = getUserData(map)
        val data = getDataJSONObject(map)

        return InitialSubscriptionEvent(
            data,
            userData,
        ).apply {
            addPredefinedParameters(this, map)
        }
    }

    private fun eventInitialTrialEvent(map: Map<*, *>): InitialTrialEvent {
        val userData = getUserData(map)
        val data = getDataJSONObject(map)
        
        return InitialTrialEvent(
            data,
            userData,
        ).apply {
            addPredefinedParameters(this, map)
        }
    }

    private fun eventInitialOfferEvent(map: Map<*, *>): InitialOfferEvent {
        val userData = getUserData(map)
        val data = getDataJSONObject(map)
        
        return InitialOfferEvent(
            data,
            userData,
        ).apply {
            addPredefinedParameters(this, map)
        }
    }

    private fun eventFailedTrialEvent(map: Map<*, *>): FailedTrialEvent {
        val userData = getUserData(map)
        val data = getDataJSONObject(map)
        
        return FailedTrialEvent(
            data,
            userData,
        ).apply {
            addPredefinedParameters(this, map)
        }
    }

    private fun eventFailedOfferiseEvent(map: Map<*, *>): FailedOfferiseEvent {
        val userData = getUserData(map)
        val data = getDataJSONObject(map)
        
        return FailedOfferiseEvent(
            data,
            userData,
        ).apply {
            addPredefinedParameters(this, map)
        }
    }

    private fun eventFailedSubscriptionEvent(map: Map<*, *>): FailedSubscriptionEvent {
        val userData = getUserData(map)
        val data = getDataJSONObject(map)
        
        return FailedSubscriptionEvent(
            data,
            userData,
        ).apply {
            addPredefinedParameters(this, map)
        }
    }

    private fun eventFailedTrialFromRetryEvent(map: Map<*, *>): FailedTrialFromRetryEvent {
        val userData = getUserData(map)
        val data = getDataJSONObject(map)
        
        return FailedTrialFromRetryEvent(
            data,
            userData,
        ).apply {
            addPredefinedParameters(this, map)
        }
    }

    private fun eventFailedOfferFromRetryEvent(map: Map<*, *>): FailedOfferFromRetryEvent {
        val userData = getUserData(map)
        val data = getDataJSONObject(map)
        
        return FailedOfferFromRetryEvent(
            data,
            userData,
        ).apply {
            addPredefinedParameters(this, map)
        }
    }

    private fun eventFailedSubscriptionFromRetryEvent(map: Map<*, *>): FailedSubscriptionFromRetryEvent {
        val userData = getUserData(map)
        val data = getDataJSONObject(map)
        
        return FailedSubscriptionFromRetryEvent(
            data,
            userData,
        ).apply {
            addPredefinedParameters(this, map)
        }
    }

    private fun eventTrialInRetryEvent(map: Map<*, *>): TrialInRetryEvent {
        val userData = getUserData(map)
        val data = getDataJSONObject(map)
        
        return TrialInRetryEvent(
            data,
            userData,
        ).apply {
            addPredefinedParameters(this, map)
        }
    }

    private fun eventOfferInRetryEvent(map: Map<*, *>): OfferInRetryEvent {
        val userData = getUserData(map)
        val data = getDataJSONObject(map)
        
        return OfferInRetryEvent(
            data,
            userData,
        ).apply {
            addPredefinedParameters(this, map)
        }
    }

    private fun eventSubscriptionInRetryEvent(map: Map<*, *>): SubscriptionInRetryEvent {
        val userData = getUserData(map)
        val data = getDataJSONObject(map)
        
        return SubscriptionInRetryEvent(
            data,
            userData,
        ).apply {
            addPredefinedParameters(this, map)
        }
    }

    private fun eventConvertedTrialEvent(map: Map<*, *>): ConvertedTrialEvent {
        val userData = getUserData(map)
        val data = getDataJSONObject(map)
        
        return ConvertedTrialEvent(
            data,
            userData,
        ).apply {
            addPredefinedParameters(this, map)
        }
    }

    private fun eventConvertedOfferEvent(map: Map<*, *>): ConvertedOfferEvent {
        val userData = getUserData(map)
        val data = getDataJSONObject(map)
        
        return ConvertedOfferEvent(
            data,
            userData,
        ).apply {
            addPredefinedParameters(this, map)
        }
    }

    private fun eventReactivatedSubscriptionEvent(map: Map<*, *>): ReactivatedSubscriptionEvent {
        val userData = getUserData(map)
        val data = getDataJSONObject(map)
        
        return ReactivatedSubscriptionEvent(
            data,
            userData,
        ).apply {
            addPredefinedParameters(this, map)
        }
    }

    private fun eventRenewedSubscriptionEvent(map: Map<*, *>): RenewedSubscriptionEvent {
        val userData = getUserData(map)
        val data = getDataJSONObject(map)
        
        return RenewedSubscriptionEvent(
            data,
            userData,
        ).apply {
            addPredefinedParameters(this, map)
        }
    }

    private fun eventConvertedTrialFromRetryEvent(map: Map<*, *>): ConvertedTrialFromRetryEvent {
        val userData = getUserData(map)
        val data = getDataJSONObject(map)
        
        return ConvertedTrialFromRetryEvent(
            data,
            userData,
        ).apply {
            addPredefinedParameters(this, map)
        }
    }

    private fun eventConvertedOfferFromRetryEvent(map: Map<*, *>): ConvertedOfferFromRetryEvent {
        val userData = getUserData(map)
        val data = getDataJSONObject(map)
        
        return ConvertedOfferFromRetryEvent(
            data,
            userData,
        ).apply {
            addPredefinedParameters(this, map)
        }
    }

    private fun eventRenewedSubscriptionFromRetryEvent(map: Map<*, *>): RenewedSubscriptionFromRetryEvent {
        val userData = getUserData(map)
        val data = getDataJSONObject(map)
        
        return RenewedSubscriptionFromRetryEvent(
            data,
            userData,
        ).apply {
            addPredefinedParameters(this, map)
        }
    }
}