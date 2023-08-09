import 'package:affise_attribution_lib/affise.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

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
  String _callback = "";

  @override
  void initState() {
    super.initState();
    initAffise();
  }

  void _cbState(String data) {
    setState(() {
      _callback = data;
    });
  }

  void initAffise() async {
    AffiseInitProperties properties = AffiseInitProperties(
      affiseAppId: "Your appId", //Change to your app id
      secretKey: "Your secretId", //Change to your SDK key
    );

    Affise.init(properties);
    Affise.registerDeeplinkCallback((uri) {
      _cbState("Deeplink: $uri");
      if (kDebugMode) {
        print("Deeplink $uri");
      }
    });

    Affise.android.getReferrerValue(ReferrerKey.CLICK_ID, (value) {
      if (kDebugMode) {
        print("ReferrerValue: $value");
      }
    });

    Affise.android.getReferrer((value) {
      if (kDebugMode) {
        print("Referrer: $value");
      }
    });

    Affise.getStatus(AffiseModules.STATUS, (value) {
      if (kDebugMode) {
        print("Modules status: $value");
      }
    });

    Affise.ios.registerAppForAdNetworkAttribution((error) {
      if (kDebugMode) {
        print("SKAd registerAppForAdNetworkAttribution: $error");
      }
    });

    Affise.ios.updatePostbackConversionValue(
        1, SKAdNetwork.CoarseConversionValue.medium, (error) {
      if (kDebugMode) {
        print("SKAd updatePostbackConversionValue: $error");
      }
    });
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
              Container(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(8),
                      child: Text(_callback),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Affise.getStatus(AffiseModules.STATUS, (value) {
                          _cbState("Status: ${value.toString()}");
                        });
                      },
                      child: const Text("Status"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Affise.android.getReferrer((value) {
                          _cbState("Referrer: $value");
                        });
                      },
                      child: const Text("Referrer"),
                    ),
                  ],
                ),
              ),
              const AffiseWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
