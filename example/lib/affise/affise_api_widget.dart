import 'package:affise_attribution_lib/affise.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AffiseApiWidget extends StatefulWidget {
  final ValueNotifier<String>  output;

  const AffiseApiWidget(this.output, {super.key});

  @override
  State<StatefulWidget> createState() => _AffiseApiWidgetState();
}

class _AffiseApiWidgetState extends State<AffiseApiWidget> {

  TextEditingController output = TextEditingController();

  @override
  void initState() {
    super.initState();
    widget.output.addListener(() {
      setOutput(widget.output.value);
    });
  }

  void setOutput(String data) {
    output.text = data;

    if (kDebugMode) {
      print(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(8),
            child: TextField(
              controller: output,
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Debug: Validate credentials https://github.com/affise/flutter-sdk#validate-credentials
                      Affise.debug.validate((status) {
                        setOutput("Validate: $status");
                      });
                    },
                    child: const Text("Debug: Validate credentials"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Deeplinks https://github.com/affise/flutter-sdk#deeplinks
                      Affise.registerDeeplinkCallback((uri) {
                        setOutput("Deeplink: $uri");
                      });
                    },
                    child: const Text("Deeplink"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Get module state https://github.com/affise/flutter-sdk#get-module-state
                      Affise.getStatus(AffiseModules.STATUS, (value) {
                        setOutput("Status: ${value.toString()}");
                      });
                    },
                    child: const Text("Status"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Get referrer https://github.com/affise/flutter-sdk#get-referrer
                      Affise.android.getReferrer((value) {
                        setOutput("Referrer: $value");
                      });
                    },
                    child: const Text("Referrer"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Get referrer value https://github.com/affise/flutter-sdk#get-referrer-value
                      Affise.android.getReferrerValue(ReferrerKey.CLICK_ID, (value) {
                        setOutput("ReferrerValue: $value");
                      });
                    },
                    child: const Text("ReferrerValue"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // StoreKit Ad Network https://github.com/affise/flutter-sdk#storekit-ad-network
                      Affise.ios.registerAppForAdNetworkAttribution((error) {
                        setOutput("SKAd register: $error");
                      });
                    },
                    child: const Text("SKAd register"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // StoreKit Ad Network https://github.com/affise/flutter-sdk#storekit-ad-network
                      Affise.ios.updatePostbackConversionValue(1, SKAdNetwork.CoarseConversionValue.medium, (error) {
                        setOutput("SKAd update: $error");
                      });
                    },
                    child: const Text("SKAd update"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Get providers https://github.com/affise/flutter-sdk#get-providers
                      Affise.getProviders().then((data) {
                        var key = ProviderType.AFFISE_APP_TOKEN;
                        setOutput("Get Providers: $key = ${data[key]}");
                      });
                    },
                    child: const Text("Get Providers"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Get Random Device Id https://github.com/affise/flutter-sdk#get-random-device-id
                      Affise.getRandomDeviceId().then((value) {
                        setOutput("RandomDeviceId: $value");
                      });
                    },
                    child: const Text("Get Random Device Id"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Get Random User Id https://github.com/affise/flutter-sdk#get-random-user-id
                      Affise.getRandomUserId().then((value) {
                        setOutput("RandomUserId: $value");
                      });
                    },
                    child: const Text("Get Random Device Id"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  } 
}