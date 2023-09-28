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
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            margin: const EdgeInsets.all(8),
            child: TextField(
              controller: output,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Affise.registerDeeplinkCallback((uri) {
                setOutput("Deeplink: $uri");
              });
            },
            child: const Text("Deeplink"),
          ),
          ElevatedButton(
            onPressed: () {
              Affise.getStatus(AffiseModules.STATUS, (value) {
                setOutput("Status: ${value.toString()}");
              });
            },
            child: const Text("Status"),
          ),
          ElevatedButton(
            onPressed: () {
              Affise.android.getReferrer((value) {
                setOutput("Referrer: $value");
              });
            },
            child: const Text("Referrer"),
          ),
          ElevatedButton(
            onPressed: () {
              Affise.android.getReferrerValue(ReferrerKey.CLICK_ID, (value) {
                setOutput("ReferrerValue: $value");
              });
            },
            child: const Text("ReferrerValue"),
          ),
          ElevatedButton(
            onPressed: () {
              Affise.ios.registerAppForAdNetworkAttribution((error) {
                setOutput("SKAd register: $error");
              });
            },
            child: const Text("SKAd register"),
          ),
          ElevatedButton(
            onPressed: () {
              Affise.ios.updatePostbackConversionValue(1, SKAdNetwork.CoarseConversionValue.medium, (error) {
                setOutput("SKAd update: $error");
              });
            },
            child: const Text("SKAd update"),
          ),
          ElevatedButton(
            onPressed: () {
              Affise.getProviders().then((data) {
                var key = ProviderType.AFFISE_APP_TOKEN;
                setOutput("Get Providers: $key = ${data[key]}");
              });
            },
            child: const Text("Get Providers"),
          ),
        ],
      ),
    );
  } 
}