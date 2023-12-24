import "package:http/src/response.dart" show Response;
import 'package:weather_clean_app/core/commundomain/entities/api_result_model.dart';
import 'package:weather_clean_app/core/utils/constants/app_constants.dart';
import 'package:weather_clean_app/core/utils/helpers/extension_function/extension_function.dart';
import 'package:weather_clean_app/core/utils/helpers/extension_function/http_response_extensions.dart';
import 'package:weather_clean_app/core/utils/helpers/http_strategy_helper/http_request_strategy.dart';

import 'package:http/http.dart' as http;

class GetRequestStrategy implements HttpRequestStrategy {
  @override
  Future<ApiResultModel<Response>> executeRequest(
      {required String uri,
      Map<String, String> headers = const <String, String>{},
      Map<String, dynamic> requestData = const <String, dynamic>{}}) async {
    final http.Response response = await http.get(uri.parseUri(requestData), headers: headers).timeout(timeOutDuration) ;

    return response.performHttpRequest();
  }
}
