import 'package:affise_attribution_lib/affise.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'affise/affise_api_widget.dart';
import 'affise/affise_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  ValueNotifier<String> output = ValueNotifier("");

  @override
  void initState() {
    super.initState();
    initAffise();
  }

  void setOutput(String data) {
    output.value = data;
  }

  void initAffise() async {
    // Initialize https://github.com/affise/flutter-sdk#initialize
    Affise
        .settings(
          affiseAppId: "129", //Change to your app id
          secretKey: "93a40b54-6f12-443f-a250-ebf67c5ee4d2", //Change to your SDK key
        )
        .setProduction(false) //To enable debug methods set Production to false
        .start(); // Start Affise SDK

    // Deeplinks https://github.com/affise/flutter-sdk#deeplinks
    Affise.registerDeeplinkCallback((uri) {
      setOutput("Deeplink: $uri");
    });

    // Debug: network request/response
    Affise.debug.network((request, response) {
      if (kDebugMode) {
        print("Affise: $request");
        print("Affise: $response");
      }
    });

    // SDK to SDK integrations https://github.com/affise/flutter-sdk#sdk-to-sdk-integrations
    // AffiseAdRevenue(AffiseAdSource.ADMOB)
    //   .setRevenue(2.5, "USD")
    //   .setNetwork("network")
    //   .setUnit("unit")
    //   .setPlacement("placement")
    //   .send();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(Icons.swap_horiz),
                      SizedBox(width: 8),
                      Text('API'),
                    ],
                  ),
                ),
                Tab(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(Icons.file_upload),
                      SizedBox(width: 8),
                      Text('Events'),
                    ],
                  ),
                ),
              ],
            ),
            title: const Text('Affise Demo'),
          ),
          body: TabBarView(
            children: [
              AffiseApiWidget(output),
              const AffiseWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
