import '../utils/try_cast.dart';
import '../utils/uuid.dart';
import 'affise_api_method.dart';
import 'native_base_platform.dart';

class NativeBase extends NativeBasePlatform {
  static const _UUID = "callback_uuid";

  final Map<String, dynamic> _callbacksOnce = {};
  final Map<AffiseApiMethod, dynamic> _callbacks = {};

  Future<T?> native<T>(AffiseApiMethod api, [dynamic data]) {
    Map<String, dynamic> apiData = {
      api.apiName: data,
    };
    return apiCall(api.apiName, apiData);
  }

  void nativeCallbackOnce(AffiseApiMethod api, dynamic callback, [dynamic data]) {
    String uuid = Uuid.generate();
    Map<String, dynamic> apiData = {
      api.apiName: data,
      _UUID: uuid,
    };
    _callbacksOnce[uuid] = callback;
    apiCall(api.apiName, apiData);
  }

  void nativeCallback(AffiseApiMethod api, dynamic callback, [dynamic data]) {
    Map<String, dynamic> apiData = {
      api.apiName: data,
    };
    _callbacks[api] = callback;
    apiCall(api.apiName, apiData);
  }

  @override
  void apiCallback(String apiName, dynamic arguments) {
    AffiseApiMethod? api = apiMethodFrom(apiName);
    if (api == null) return;
    Map<Object?, Object?>? map = tryCast<Map<Object?, Object?>>(arguments);
    String? uuid = map?[_UUID]?.toString();
    dynamic data = map?[apiName];
    if (uuid == null || uuid.isEmpty) {
      dynamic callback = _callbacks[api];
      handleCallback(api, callback, data);
    } else {
      dynamic callback = _callbacksOnce[uuid];
      handleCallback(api, callback, data);
      _callbacksOnce.remove(uuid);
    }
  }

  void handleCallback(AffiseApiMethod api, dynamic callback, dynamic data) {}
}
