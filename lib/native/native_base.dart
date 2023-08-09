import 'dart:collection';

import '../utils/try_cast.dart';
import '../utils/uuid.dart';
import 'affise_api_method.dart';
import 'native_base_platform.dart';


class NativeBase extends NativeBasePlatform {

  static const _UUID = "callback_uuid";

  final Map<String, dynamic> _callbacks = {};

  Future<T?> native<T>(AffiseApiMethod api, [dynamic data]) {
    Map<String, dynamic> apiData = {
      api.apiName: data,
    };
    return apiCall(api.apiName, apiData);
  }

  void nativeCallback(AffiseApiMethod api, dynamic callback, [dynamic data]) {
    String uuid = Uuid.generate();
    Map<String, dynamic> apiData = {
      api.apiName: data,
      _UUID: uuid
    };
    _callbacks[uuid] = callback;
    apiCall(api.apiName, apiData);
  }

  @override
  void apiCallback(String apiName, dynamic arguments) {
    AffiseApiMethod? api = apiFromString(apiName);
    if (api == null) return;
    LinkedHashMap<Object?, Object?>? map = tryCast<LinkedHashMap<Object?, Object?>>(arguments);
    String? uuid = map?[_UUID]?.toString();
    if (uuid == null || uuid.isEmpty) return;
    dynamic data = map?[apiName];
    dynamic callback = _callbacks[uuid];
    handleCallback(api, callback, data);
    _callbacks.remove(uuid);
  }

  void handleCallback(AffiseApiMethod api, dynamic callback, dynamic data) {}
}