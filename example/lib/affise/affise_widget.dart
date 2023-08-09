import 'package:affise_attribution_lib/affise.dart';
import 'package:affise_attribution_lib/events/subscription/base_subscription_event.dart';
import 'package:flutter/material.dart';

import 'factories/default_events_factory.dart';

class AffiseWidget extends StatefulWidget {
  const AffiseWidget({super.key});

  @override
  State<StatefulWidget> createState() => _AffiseWidgetState();
}

class _AffiseWidgetState extends State<AffiseWidget> {
  List<Event> items = [];

  @override
  void initState() {
    super.initState();
    DefaultEventsFactory factory = DefaultEventsFactory();
    items = factory.createEvents();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Container(
        //   margin: const EdgeInsets.only(left: 8, right: 8),
        //   child: ElevatedButton(
        //     onPressed: () {
        //       for (var item in items) {
        //         Affise.sendEvent(item);
        //       }
        //     },
        //     style: ElevatedButton.styleFrom(
        //       backgroundColor: Colors.red,
        //     ),
        //     child: const Text("Send All"),
        //   ),
        // ),
        Flexible(
          child: ListView.builder(
            padding: const EdgeInsets.only(left: 8, right: 8),
            itemCount: items.length,
            itemBuilder: (context, index) {
              return ElevatedButton(
                onPressed: () {
                  Affise.sendEvent(items[index]);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: (items[index] is BaseSubscriptionEvent)
                      ? Colors.red
                      : Colors.blue,
                ),
                child: Text(items[index].runtimeType.toString()),
              );
            },
          ),
        ),
      ],
    );
  }
}
