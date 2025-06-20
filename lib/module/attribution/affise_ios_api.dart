import '../../export.dart';

abstract class AffiseIOSApi {
  const AffiseIOSApi();

  void registerAppForAdNetworkAttribution(ErrorCallback completionHandler);

  void updatePostbackConversionValue(int fineValue, CoarseValue coarseValue, ErrorCallback completionHandler);

  void getReferrerOnServer(ReferrerCallback callback);

  void getReferrerOnServerValue(ReferrerKey key, ReferrerCallback callback);
}