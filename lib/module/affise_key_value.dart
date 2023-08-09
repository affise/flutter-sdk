import 'dart:collection';

import '../utils/try_cast.dart';

class AffiseKeyValue {
  String key = "";
  String value = "";

  AffiseKeyValue(this.key, this.value);

  @override
  String toString() {
    return "{key: $key, value: $value}";
  }
}

extension AffiseKeyValueExt on List<Object?> {
  List<AffiseKeyValue> get toAffiseKeyValueList {
    List<AffiseKeyValue> result = [];
    for (Object? e in this) {
      LinkedHashMap<Object?, Object?>? t = tryCast<LinkedHashMap<Object?, Object?>>(e);
      String? key = t?["key"]?.toString();
      String? value = t?["value"]?.toString();
      if (key == null || value == null) continue;
      result.add(AffiseKeyValue(key, value));
    }
    return result;
  }
}
