import '../affise.dart';

class AffiseSettings {
  final String affiseAppId;
  final String secretKey;
  String? _domain;
  bool _isProduction = true;
  String? _partParamName;
  String? _partParamNameToken;
  String? _appToken;
  // List<AutoCatchingType>? _autoCatchingClickEvents;
  // bool _enabledMetrics = false;

  /// Affise SDK settings
  /// [affiseAppId] - your app id
  /// [secretKey] - your SDK secretKey
  AffiseSettings(this.affiseAppId, this.secretKey);

  /// Set Affise SDK for SandBox / Production
  AffiseSettings setProduction(bool production) {
    _isProduction = production;
    return this;
  }

  /// Set Affise SDK server [domain]. Trailing slash is irrelevant
  AffiseSettings setDomain(String domain) {
    _domain = domain;
    return this;
  }

  /// Only for specific use case
  AffiseSettings setPartParamName(String partParamName) {
    _partParamName = partParamName;
    return this;
  }

  /// Only for specific use case
  AffiseSettings setPartParamNameToken(String partParamNameToken) {
    _partParamNameToken = partParamNameToken;
    return this;
  }

  /// Set [appToken]
  AffiseSettings setAppToken(String appToken) {
    _appToken = appToken;
    return this;
  }

  /// Set [autoCatchingClickEvents] list of AutoCatchingType
  // AffiseSettings setAutoCatchingClickEvents(List<AutoCatchingType>? autoCatchingClickEvents) {
  //   _autoCatchingClickEvents = autoCatchingClickEvents;
  //   return this;
  // }

  /// Set Metrics [enable]
  // AffiseSettings setEnabledMetrics(bool enable) {
  //   _enabledMetrics = enable;
  //   return this;
  // }

  AffiseInitProperties _getInitProperties() {
    return AffiseInitProperties(
      affiseAppId: affiseAppId,
      secretKey: secretKey,
      isProduction: _isProduction,
      appToken: _appToken,
      // autoCatchingClickEvents: _autoCatchingClickEvents,
      partParamName: _partParamName,
      partParamNameToken: _partParamNameToken,
      // enabledMetrics: _enabledMetrics,
      domain: _domain,
    );
  }

  /// Starts Affise SDK
  void start() {
    Affise.start(_getInitProperties());
  }
}
