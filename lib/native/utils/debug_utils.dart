import '../../debug/validate/validation_status.dart';
import '../../network/http_method.dart';
import '../../network/http_request.dart';
import '../../network/http_response.dart';
import '../../utils/try_cast.dart';

class DebugUtils {
  static ValidationStatus getValidationStatus(dynamic data) {
    return validationStatusFrom(data?.toString()) ??
        ValidationStatus.UNKNOWN_ERROR;
  }

  static HttpRequest parseRequest(dynamic data) {
    var json = tryCast<Map<Object?, Object?>>(data);
    var headersRaw = tryCast<Map<Object?, Object?>>(json?["headers"]);
    Map<String, String> reqHeaders = {};

    headersRaw?.forEach((key, value) {
      reqHeaders[key.toString()] = value.toString();
    });

    Uri reqUrl = Uri.parse(json?["url"]?.toString() ?? "");
    HttpMethod? reqMethod = httpMethodFrom(json?["method"]?.toString());
    String? reqBody = json?["body"]?.toString();

    return HttpRequest(
      reqUrl,
      reqMethod ?? HttpMethod.POST,
      reqHeaders,
      reqBody,
    );
  }

  static HttpResponse parseResponse(dynamic data) {
    var json = tryCast<Map<Object?, Object?>>(data);
    int resCode = int.tryParse(json?["code"]?.toString() ?? "") ?? 0;
    String resMessage = json?["message"]?.toString() ?? "";
    String? resBody = json?["body"]?.toString();

    return HttpResponse(
      resCode,
      resMessage,
      resBody,
    );
  }

  static HttpRequest parseRequestMap(dynamic data, String key) {
    var json = tryCast<Map<Object?, Object?>>(data);
    var request = tryCast<Map<Object?, Object?>>(json?[key]);
    return parseRequest(request);
  }

  static HttpResponse parseResponseMap(dynamic data, String key) {
    var json = tryCast<Map<Object?, Object?>>(data);
    var response = tryCast<Map<Object?, Object?>>(json?[key]);
    return parseResponse(response);
  }
}
