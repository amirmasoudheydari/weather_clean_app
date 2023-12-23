import 'dart:async';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:weather_clean_app/core/commundomain/entities/api_result_model.dart';
import 'package:weather_clean_app/core/commundomain/entities/error_result_model.dart';
import 'package:weather_clean_app/core/utils/constants/app_constants.dart';
import 'package:weather_clean_app/core/utils/helpers/connectivity_helper/connectivity_checker_helper.dart';
import 'package:weather_clean_app/core/utils/helpers/custom_exceptions/custom_connection_exception.dart';
import 'package:weather_clean_app/core/utils/helpers/extensiion_functiions/extention_functions.dart';

@Injectable()
class ApiCallHelper {
  ApiCallHelper(this.connectivityCheckerHelper);

  final ConnectivityCheckerHelper connectivityCheckerHelper;
  final String? baseUrl = "";
  Map<String, String> _sharedDefaultHeader = const <String, String>{};

  Future<void> initSharedDefaultHeader(
      [String contentValue = contentTypeValue]) async {
    _sharedDefaultHeader = <String, String>{};
    _sharedDefaultHeader
        .addAll(<String, String>{contentTypeValue: contentValue});
  }

  Future<bool> _getConnectionState() async {
    final bool result = await connectivityCheckerHelper.checkConnectivity();
    return result;
  }

  // @[params] should be add to the url as the api params
  Future<ApiResultModel<http.Response>> getWS(
      {required String uri,
      Map<String, String> headers = const <String, String>{},
      Map<String, dynamic> params = const <String, dynamic>{}}) async {
    await initSharedDefaultHeader();

    if (await _getConnectionState()) {
      try {
        final String _url = '$baseUrl';

        final http.Response response = await http
            .get(_url.parseUri(params), headers: _sharedDefaultHeader)
            .timeout(timeDuration);

        if (response.statusCode >= 200 && response.statusCode < 300) {
          return ApiResultModel<http.Response>.success(data: response);
        } else {
          return ApiResultModel<http.Response>.failure(
              errorResultEntity: ErrorResultModel(
                  message: response.reasonPhrase,
                  statusCode: response.statusCode));
        }
      } on TimeoutException catch (_) {
        return const ApiResultModel<http.Response>.failure(
            errorResultEntity: ErrorResultModel(
                message: commonErrorUnexpectedMessage,
                statusCode: timeoutRequestStatusCode));
      } on IOException catch (_) {
        throw const CustomConnectionException(
            exceptionCode: ioExceptionStatusCode,
            exceptionMessage: commonConnectionFailedMessage);
      }
    } else {
      throw const CustomConnectionException(
          exceptionCode: ioExceptionStatusCode,
          exceptionMessage: commonConnectionFailedMessage);
    }
  }
}
