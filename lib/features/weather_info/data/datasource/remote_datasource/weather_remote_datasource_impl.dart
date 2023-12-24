import 'package:http/http.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_clean_app/core/commundomain/entities/api_result_model.dart';
import 'package:weather_clean_app/core/commundomain/entities/error_result_model.dart';
import 'package:weather_clean_app/core/utils/constants/app_constants.dart';
import 'package:weather_clean_app/core/utils/helpers/custom_exceptions/custom_connection_exception.dart';
import 'package:weather_clean_app/core/utils/helpers/extension_function/extension_function.dart';
import 'package:weather_clean_app/core/utils/helpers/http_strategy_helper/concrete_strategies/get_request_strategy.dart';
import 'package:weather_clean_app/core/utils/helpers/http_strategy_helper/http_request_context.dart';
import 'package:weather_clean_app/features/weather_info/data/datasource/remote_datasource/weather_remote_datasource.dart';
import 'package:weather_clean_app/features/weather_info/data/models/weather_info_remote_response_model/weather_info_response_model.dart';
import 'package:weather_clean_app/features/weather_info/utils/weather_by_coordinate_requeste_model.dart';

@Injectable(as: WeatherRemoteDataSource)
class WeatherRemoteDataSourceImpl implements WeatherRemoteDataSource {
  WeatherRemoteDataSourceImpl(this._apiCallHelper);

  final HttpRequestContext _apiCallHelper;

  @override
  Future<ApiResultModel<WeatherInfoResponseModel>> getWeatherDataByCity(
      {String? cityName}) async {
    try {
      final ApiResultModel<Response> _result = await _apiCallHelper.makeRequest(
          uri: getWeatherDetails,
          httpRequestStrategy: GetRequestStrategy(),
          requestData: <String, dynamic>{
            cityNameKey: cityName,
            appIdKey: appIdKey
          });

      return _result.when(success: (Response response) {
        return ApiResultModel<WeatherInfoResponseModel>.success(
            data: WeatherInfoResponseModel.fromJson(response.decodeJson()));
      }, failure: (ErrorResultModel errorModel) {
        return ApiResultModel<WeatherInfoResponseModel>.failure(
            errorResultEntity: errorModel);
      });
    } on CustomConnectionException catch (exception) {
      throw CustomConnectionException(
          exceptionCode: exception.exceptionCode,
          exceptionMessage: exception.exceptionMessage);
    }
  }

  @override
  Future<ApiResultModel<WeatherInfoResponseModel?>> getWeatherDataByCoordinate(
      {WeatherByCoordinateRequestModel?
          weatherByCoordinateRequestModel}) async {
    try {
      final ApiResultModel<Response> _result = await _apiCallHelper.makeRequest(
          uri: getWeatherDetails,
          httpRequestStrategy: GetRequestStrategy(),
          requestData: <String, dynamic>{
            latitudeKey: weatherByCoordinateRequestModel?.lat,
            longitudeKey: weatherByCoordinateRequestModel?.lon,
            appIdKey: appIdKey
          });

      return _result.when(success: (Response response) {
        return ApiResultModel<WeatherInfoResponseModel?>.success(
            data: WeatherInfoResponseModel.fromJson(response.decodeJson()));
      }, failure: (ErrorResultModel errorModel) {
        return ApiResultModel<WeatherInfoResponseModel?>.failure(
            errorResultEntity: errorModel);
      });
    } on CustomConnectionException catch (exception) {
      throw CustomConnectionException(
          exceptionCode: exception.exceptionCode,
          exceptionMessage: exception.exceptionMessage);
    }
  }
}
