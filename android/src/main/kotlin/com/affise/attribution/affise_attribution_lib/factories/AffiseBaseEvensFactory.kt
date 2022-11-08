package com.affise.attribution.affise_attribution_lib.factories

import com.affise.attribution.events.Event
import com.affise.attribution.affise_attribution_lib.ext.toJSONObject
import com.affise.attribution.affise_attribution_lib.ext.toPredefinedParameters
import org.json.JSONArray
import org.json.JSONObject

abstract class AffiseBaseEvensFactory {

    companion object {
        private const val KEY_SERIALIZE = "serialize"
        private const val KEY_USERDATA = "userData"
        private const val KEY_PREDEFINED_PARAMETERS = "predefinedParameters"

        const val KEY_NAME = "name"
        const val KEY_SUBTYPE = "subtype"
        const val KEY_DATA = "data"
    }

    abstract fun event(map: Map<*, *>?): Event?

    private fun getSerialize(map: Map<*, *>): Map<*, *>? {
        return map[KEY_SERIALIZE] as? Map<*, *>
    }

    private fun getSerializeKey(map: Map<*, *>, key: String): Any? {
        return getSerialize(map)?.get(key)
    }

    private fun getSerializeMap(map: Map<*, *>, dataKey: String): Map<*, *> {
        return getSerializeKey(map, dataKey) as? Map<*, *>
            ?: emptyMap<String, Any?>()
    }

    private fun getSerializeList(map: Map<*, *>, dataKey: String): List<*> {
        return getSerializeKey(map, dataKey) as? List<*>
            ?: emptyList<Any>()
    }

    protected fun getSerializeStringOrNull(map: Map<*, *>, dataKey: String): String? {
        return getSerializeKey(map, dataKey)?.toString()
    }

    protected fun getSerializeString(map: Map<*, *>, dataKey: String): String {
        return getSerializeKey(map, dataKey)?.toString() ?: ""
    }

    protected fun getJSONObjectOrNull(map: Map<*, *>, key: String): JSONObject? {
        return getSerializeMap(map, key).toJSONObject()
    }

    protected fun getJSONObject(map: Map<*, *>, key: String): JSONObject {
        return getSerializeMap(map, key).toJSONObject() ?: JSONObject()
    }

    protected fun addPredefinedParameters(event: Event, map: Map<*, *>) {
        (map[KEY_PREDEFINED_PARAMETERS] as? Map<*, *>)?.map {
            it.key?.toString()?.toPredefinedParameters() to it.value.toString()
        }?.toMap()?.forEach { entry ->
            entry.key?.let {
                event.addPredefinedParameter(it, entry.value)
            }
        }
    }

    protected fun getUserData(map: Map<*, *>): String? {
        return map[KEY_USERDATA]?.toString()
    }

    protected fun getUserDataAndTimeStamp(map: Map<*, *>, timeStampKey: String): Pair<Long, String?> {
        val timeStamp = getSerializeStringOrNull(map, timeStampKey)?.toLong() ?: 0L
        val userData = getUserData(map)
        return Pair(timeStamp, userData)
    }

    protected fun getJsonList(map: Map<*, *>, dataKey: String): List<JSONObject> {
        val data = getSerializeList(map, dataKey)

        val jsonList = JSONArray(data).let { jsonArray ->
            val list = mutableListOf<JSONObject>()
            for (i in 0 until jsonArray.length()) {
                jsonArray.getJSONObject(i)?.let {
                    list.add(it)
                }
            }
            return@let list
        }

        return jsonList
    }

    protected fun getJSONArray(map: Map<*, *>, dataKey: String): JSONArray {
        val data = getSerializeList(map, dataKey)
        return JSONArray(data)
    }
}