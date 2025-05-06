import 'dart:core';

import 'events/auto_catching_type.dart';
import 'settings/affise_config.dart';
import 'settings/on_init_error_handler.dart';
import 'settings/on_init_success_handler.dart';

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
  OnInitSuccessHandler? onInitSuccessHandler;
  OnInitErrorHandler? onInitErrorHandler;
  Map<String, dynamic> configValues = {};

  AffiseInitProperties({
    required this.affiseAppId,
    required this.secretKey,
    this.isProduction = true,
    this.partParamName,
    this.partParamNameToken,
    this.appToken,
    // this.enabledMetrics = false,
    // this.autoCatchingClickEvents,
    this.domain,
    this.onInitSuccessHandler,
    this.onInitErrorHandler,
    this.configValues = const {},
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
      'configStrings': configValues,
    };
  }
}
