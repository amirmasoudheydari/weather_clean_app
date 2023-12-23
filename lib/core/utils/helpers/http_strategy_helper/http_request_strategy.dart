import 'package:http/http.dart' as http;
import 'package:weather_clean_app/core/commundomain/entities/api_result_model.dart';

abstract class HttpRequestStrategy {
  Future<ApiResultModel<http.Response>> executeRequest(
      {required String uri,
      Map<String, String> headers = const <String, String>{},
      Map<String, dynamic> requestData = const <String, dynamic>{}});
}
