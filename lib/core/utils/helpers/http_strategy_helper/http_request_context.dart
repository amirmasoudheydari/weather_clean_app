import 'dart:async';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:weather_clean_app/core/commundomain/entities/api_result_model.dart';
import 'package:weather_clean_app/core/commundomain/entities/error_result_model.dart';
import 'package:weather_clean_app/core/di/app_component/app_component.dart';
import 'package:weather_clean_app/core/utils/constants/app_constants.dart';
import 'package:weather_clean_app/core/utils/helpers/app_flavors_helper/app_flavors_helper.dart';
import 'package:weather_clean_app/core/utils/helpers/connectivity_helper/connectivity_checker_helper.dart';
import 'package:weather_clean_app/core/utils/helpers/custom_exceptions/custom_connection_exception.dart';
import 'package:weather_clean_app/core/utils/helpers/http_strategy_helper/http_request_strategy.dart';

@Injectable()
class HttpRequestContext {
  final ConnectivityCheckerHelper connectivityCheckerHelper;

  HttpRequestContext(this.connectivityCheckerHelper);

  final String? baseUrl = locator<AppFlavorsHelper>().baseUrl;

  Map<String, String> _sharedDefaultHeader = <String, String>{};

  Future<void> initSharedDefaultHeader(
      [String contentType = contentTypeValue]) async {
    _sharedDefaultHeader = <String, String>{};
    _sharedDefaultHeader
        .addAll(<String, String>{contentTypeKey: contentTypeValue});
  }

  Future<bool> _getConnectionState() async {
    final bool result = await connectivityCheckerHelper.checkConnectivity();

    return result;
  }

  Future<ApiResultModel<http.Response>> makeRequest(
      {required String uri,
      required HttpRequestStrategy httpRequestStrategy,
      Map<String, String> headers = const <String, String>{},
      Map<String, dynamic> requestData = const <String, dynamic>{}}) async {
    await initSharedDefaultHeader();
    _sharedDefaultHeader.addAll(headers);
    if (await _getConnectionState()) {
      try {
        final String _url = '$baseUrl$Uri';

        return httpRequestStrategy.executeRequest(
            uri: _url, headers: _sharedDefaultHeader, requestData: requestData);
      } on TimeoutException catch (_) {
        return const ApiResultModel<http.Response>.failure(
            errorResultEntity: ErrorResultModel(
                statusCode: timeoutRequestStatusCode,
                message: commonErrorUnexpectedMessage));
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
