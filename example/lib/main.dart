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
      partParamName: "Your partParamName", //Change to your partParamName
      partParamNameToken: "Your partParamNameToken", //Change to your partParamNameToken
      appToken: "Your appToken", //Change to your appToken
      isProduction: kReleaseMode, //Add your custom rule to determine if this is a production build
      secretId: "Your secretId", //Change to your appToken
    );

    Affise.init(properties);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              Map<String, dynamic> items = {
                "items": "cookies, potato, milk",
              };

              AddToCartEvent event = AddToCartEvent(
                addToCartObject: items,
                timeStampMillis: DateTime.now().millisecondsSinceEpoch,
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
