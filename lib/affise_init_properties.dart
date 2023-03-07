import 'dart:core';

import 'affise_flags.dart';
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
  // List<AffiseFlag>? flags;

  AffiseInitProperties({
    this.affiseAppId,
    this.isProduction = true,
    this.partParamName,
    this.partParamNameToken,
    this.appToken,
    this.secretId,
    this.enabledMetrics = false,
    this.autoCatchingClickEvents,
    // this.flags,
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
      // 'flags': flags?.toStringList,
    };
  }
}
