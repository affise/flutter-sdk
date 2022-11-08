import 'package:affise_attribution_lib/events/event.dart';

abstract class NativeEvent extends Event {

  @override
  String getCategory() => "native";
}