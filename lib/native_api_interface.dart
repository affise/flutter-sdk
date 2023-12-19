import 'export.dart';

abstract class AffiseAndroidApi {
  const AffiseAndroidApi();

  void forget(String userData);

  void crashApplication();
}

abstract class AffiseIOSApi {
  const AffiseIOSApi();

  void registerAppForAdNetworkAttribution(ErrorCallback completionHandler);

  void updatePostbackConversionValue(int fineValue, CoarseValue coarseValue, ErrorCallback completionHandler);
}

abstract class AffiseDebug {
  const AffiseDebug();

  void validate(DebugOnValidateCallback callback);

  void network(DebugOnNetworkCallback callback);
}