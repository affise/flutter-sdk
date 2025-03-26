import 'export.dart';

abstract class AffiseModulesApi {
  getStatus(AffiseModules module, OnKeyValueCallback callback);

  Future<bool> moduleStart(AffiseModules module);

  Future<List<AffiseModules>> getModulesInstalled();

  void linkResolve(String url, AffiseLinkCallback callback);

  void fetchProducts(List<String> ids, AffiseResultCallback<AffiseProductsResult> callback);

  void purchase(AffiseProduct product, AffiseProductType type, AffiseResultCallback<AffisePurchasedInfo> callback);
}

abstract class AffiseAndroidApi {
  const AffiseAndroidApi();

  void forget(String userData);

  void crashApplication();
}

abstract class AffiseIOSApi {
  const AffiseIOSApi();

  void registerAppForAdNetworkAttribution(ErrorCallback completionHandler);

  void updatePostbackConversionValue(int fineValue, CoarseValue coarseValue, ErrorCallback completionHandler);

  void getReferrerOnServer(ReferrerCallback callback);

  void getReferrerOnServerValue(ReferrerKey key, ReferrerCallback callback);
}

abstract class AffiseDebug {
  const AffiseDebug();

  void validate(DebugOnValidateCallback callback);

  void network(DebugOnNetworkCallback callback);
  
  String version();
  
  Future<String> versionNative();
}