import 'dart:core';

import 'events/auto_catching_type.dart';

class AffiseInitProperties {
  String? affiseAppId;
  bool isProduction = true;
  String? partParamName;
  String? partParamNameToken;
  String? appToken;
  String? secretKey;
  List<AutoCatchingType>? autoCatchingClickEvents;
  bool enabledMetrics = false;
  String? domain;

  AffiseInitProperties({
    required this.affiseAppId,
    required this.secretKey,
    this.isProduction = true,
    this.partParamName,
    this.partParamNameToken,
    this.appToken,
    // this.enabledMetrics = false,
    // this.autoCatchingClickEvents,
    this.domain
  });

  Map<String, dynamic> get toMap {
    return <String, dynamic>{
      'affiseAppId': affiseAppId,
      'isProduction': isProduction,
      'partParamName': partParamName,
      'partParamNameToken': partParamNameToken,
      'appToken': appToken,
      'secretKey': secretKey,
      'autoCatchingClickEvents': autoCatchingClickEvents?.toStringList,
      'enabledMetrics': enabledMetrics,
      'domain': domain,
    };
  }
}
