package com.affise.attribution.affise_attribution_lib.ext

import io.flutter.plugin.common.MethodCall


fun MethodCall.argumentMap(): Map<*, *>? {
    return this.arguments as? Map<*, *>
}

fun MethodCall.argumentList(): List<*>? {
    return this.arguments as? List<*>
}

fun MethodCall.argumentString(): String {
    return this.arguments.toString()
}

fun MethodCall.argumentBoolean(): Boolean {
    return this.arguments.toString().toBoolean()
}