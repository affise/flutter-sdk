import 'package:affise_attribution_lib/affise.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    initAffise();
  }

  void initAffise() async {
    AffiseInitProperties properties = AffiseInitProperties(
      affiseAppId: "Your appId", //Change to your app id
      isProduction: kReleaseMode, //Add your custom rule to determine if this is a production build
      secretId: "Your secretId", //Change to your appToken
      partParamName: null, //Change to your partParamName
      partParamNameToken: null, //Change to your partParamNameToken
      appToken: null, //Change to your appToken
    );

    Affise.init(properties);
    Affise.registerDeeplinkCallback((uri) {
      if (kDebugMode) {
        print("deeplink $uri");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Affise example app'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              Map<String, dynamic> items = {
                "items": "cookies",
              };

              AddToCartEvent event = AddToCartEvent(
                addToCartObject: items,
                timeStampMillis: DateTime.now().millisecondsSinceEpoch,
              );
              event.addPredefinedParameter(
                PredefinedParameters.DESCRIPTION,
                "best before 2029",
              );
              Affise.sendEvent(event);
            },
            child: const Text("AddToCart"),
          ),
        ),
      ),
    );
  }
}