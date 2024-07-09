import 'package:affise_attribution_lib/affise.dart';
import 'package:flutter/widgets.dart';

class ApiFactory {
  void Function(String data)? output;
  void Function({required String title, required String text})? alert;

  BuildContext? context;

  Map<String, Function> create() {
    return {
      "Debug: Validate credentials": () {
        // Debug: Validate credentials https://github.com/affise/flutter-sdk#validate-credentials
        Affise.debug.validate((status) {
          output?.call("Validate: $status");
        });
      },
      "Deeplink": () {
        // Deeplinks https://github.com/affise/flutter-sdk#deeplinks
        Affise.registerDeeplinkCallback((value) {
          output?.call("Deeplink: $value");
          alert?.call(
            title: "Deeplink",
            text: "${value.deeplink}\n\n"
                "scheme: \"${value.scheme}\"\n"
                "host: \"${value.host}\"\n"
                "path: \"${value.path}\"\n\n"
                "parameters: ${value.parameters}",
          );
        });
      },
      "Status": () {
        // Get module state https://github.com/affise/flutter-sdk#get-module-state
        Affise.module.getStatus(AffiseModules.STATUS, (value) {
          output?.call("Status: ${value.toString()}");
        });
      },
      "Get Modules Installed": () {
        // Get module state https://github.com/affise/flutter-sdk#modules
        Affise.module.getModulesInstalled().then((value) {
          output?.call("Modules: $value");
        });
      },
      "Referrer": () {
        // Get referrer https://github.com/affise/flutter-sdk#get-referrer
        Affise.getReferrer((value) {
          output?.call("Referrer: $value");
        });
      },
      "ReferrerValue": () {
        // Get referrer value https://github.com/affise/flutter-sdk#get-referrer-value
        Affise.getReferrerValue(ReferrerKey.CLICK_ID, (value) {
          output?.call("ReferrerValue: $value");
        });
      },
      "SKAd register": () {
        // StoreKit Ad Network https://github.com/affise/flutter-sdk#storekit-ad-network
        Affise.ios.registerAppForAdNetworkAttribution((error) {
          output?.call("SKAd register: $error");
        });
      },
      "SKAd update": () {
        // StoreKit Ad Network https://github.com/affise/flutter-sdk#storekit-ad-network
        Affise.ios.updatePostbackConversionValue(
            1, SKAdNetwork.CoarseConversionValue.medium, (error) {
          output?.call("SKAd update: $error");
        });
      },
      "Get Providers": () {
        // Get providers https://github.com/affise/flutter-sdk#get-providers
        Affise.getProviders().then((data) {
          var key = ProviderType.AFFISE_APP_TOKEN;
          output?.call("Get Providers: $key = ${data[key]}");
        });
      },
      "Get Random User Id": () {
        // Get Random Device Id https://github.com/affise/flutter-sdk#get-random-device-id
        Affise.getRandomUserId().then((value) {
          output?.call("RandomUserId: $value");
        });
      },
      "Get Random Device Id": () {
        // Get Random User Id https://github.com/affise/flutter-sdk#get-random-user-id
        Affise.getRandomUserId().then((value) {
          output?.call("RandomUserId: $value");
        });
      },
    };
  }
}
