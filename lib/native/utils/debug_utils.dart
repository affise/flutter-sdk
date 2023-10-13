import 'package:affise_attribution_lib/debug/validate/validation_status.dart';
import 'package:affise_attribution_lib/network/http_method.dart';
import 'package:affise_attribution_lib/network/http_request.dart';
import 'package:affise_attribution_lib/network/http_response.dart';

import '../../utils/try_cast.dart';

class DebugUtils {
  static ValidationStatus getValidationStatus(dynamic data) {
    return validationStatusFrom(data?.toString()) ??
        ValidationStatus.UNKNOWN_ERROR;
  }

  static HttpRequest parseRequest(Map<Object?, Object?>? json) {
    var request = tryCast<Map<Object?, Object?>>(json?["request"]);
    var headersRaw = tryCast<Map<Object?, Object?>>(request?["headers"]);
    Map<String, String> reqHeaders = {};

    headersRaw?.forEach((key, value) {
      reqHeaders[key.toString()] = value.toString();
    });

    Uri reqUrl = Uri.parse(request?["url"]?.toString() ?? "");
    HttpMethod? reqMethod = httpMethodFrom(request?["method"]?.toString());
    String? reqBody = request?["body"]?.toString();

    return HttpRequest(
      reqUrl,
      reqMethod ?? HttpMethod.POST,
      reqHeaders,
      reqBody,
    );
  }

  static HttpResponse parseResponse(Map<Object?, Object?>? json) {
    var request = tryCast<Map<Object?, Object?>>(json?["response"]);

    int resCode = int.tryParse(request?["code"]?.toString() ?? "") ?? 0;
    String resMessage = request?["message"]?.toString() ?? "";
    String? resBody = request?["body"]?.toString();

    return HttpResponse(
      resCode,
      resMessage,
      resBody,
    );
  }
}
