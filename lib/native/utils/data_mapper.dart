import '../../deeplink/deeplink_value.dart';
import '../../module/affise_key_value.dart';
import '../../utils/try_cast.dart';

class DataMapper {
  static String toNonNullString({dynamic from}) {
    return from?.toString() ?? "";
  }

  static List<AffiseKeyValue> toAffiseKeyValueList({dynamic from}) {
    var list = tryCast<List<Object?>>(from) ?? [];

    List<AffiseKeyValue> result = [];
    for (Object? o in list) {
      var map = tryCast<Map<Object?, Object?>>(o);
      String? key = map?["key"]?.toString();
      String? value = map?["value"]?.toString();
      if (key == null || value == null) continue;
      result.add(AffiseKeyValue(
        key: key,
        value: value,
      ));
    }
    return result;
  }

  static DeeplinkValue toDeeplinkValue({dynamic from}) {
    var json = tryCast<Map<Object?, Object?>>(from);
    var parametersRaw = tryCast<Map<Object?, Object?>>(json?["parameters"]);

    Map<String, List<String>> parameters = {};

    parametersRaw?.forEach((key, value) {
      var list = tryCast<List<Object?>>(value) ?? [];
      parameters[key.toString()] = list.map((e) => e?.toString() ?? "").toList();
    });

    return DeeplinkValue(
      deeplink: json?["deeplink"]?.toString() ?? "",
      scheme: json?["scheme"]?.toString(),
      host: json?["host"]?.toString(),
      path: json?["path"]?.toString(),
      parameters: parameters,
    );
  }
}
