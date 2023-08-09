import 'callback/error_callback.dart';
import 'referrer/referrer_callback.dart';
import 'referrer/referrer_key.dart';
import 'skad/coarse_value.dart';

abstract class AffiseAndroidApi {
  const AffiseAndroidApi();

  void getReferrer(ReferrerCallback callback);

  void getReferrerValue(ReferrerKey key, ReferrerCallback callback);

  void forget(String userData);

  void crashApplication();
}

abstract class AffiseIOSApi {
  const AffiseIOSApi();

  void registerAppForAdNetworkAttribution(ErrorCallback completionHandler);

  void updatePostbackConversionValue(int fineValue, CoarseValue coarseValue, ErrorCallback completionHandler);
}