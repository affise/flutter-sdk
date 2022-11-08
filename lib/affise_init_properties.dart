import 'dart:core';

import 'events/auto_catching_type.dart';

class AffiseInitProperties {
  String? affiseAppId;
  bool isProduction = true;
  String? partParamName;
  String? partParamNameToken;
  String? appToken;
  String? secretId;
  List<AutoCatchingType>? autoCatchingClickEvents;
  bool enabledMetrics = false;

  AffiseInitProperties({
    required this.affiseAppId,
    this.isProduction = true,
    required this.partParamName,
    required this.partParamNameToken,
    required this.appToken,
    required this.secretId,
    this.enabledMetrics = false,
    this.autoCatchingClickEvents,
  });

  Map<String, dynamic> get toMap {
    return <String, dynamic>{
      'affiseAppId': affiseAppId,
      'isProduction': isProduction,
      'partParamName': partParamName,
      'partParamNameToken': partParamNameToken,
      'appToken': appToken,
      'secretId': secretId,
      'autoCatchingClickEvents': autoCatchingClickEvents?.toStringList,
      'enabledMetrics': enabledMetrics,
    };
  }
}
