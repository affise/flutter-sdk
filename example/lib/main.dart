import 'package:affise_attribution_lib/affise.dart';
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
    AffiseInitProperties properties = AffiseInitProperties(
      affiseAppId: "Your appId", //Change to your app id
      secretKey: "Your secretId", //Change to your SDK key
    );

    Affise.init(properties);
    Affise.registerDeeplinkCallback((uri) {
      setOutput("Deeplink: $uri");
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.swap_horiz),
                      SizedBox(width: 8),
                      Text('API'),
                    ],
                  ),
                ),
                Tab(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
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
