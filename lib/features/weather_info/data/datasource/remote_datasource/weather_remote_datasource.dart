import 'package:weather_clean_app/core/commundomain/entities/api_result_model.dart';
import 'package:weather_clean_app/features/weather_info/data/models/weather_info_remote_response_model/weather_info_response_model.dart';
import 'package:weather_clean_app/features/weather_info/utils/weather_by_coordinate_requeste_model.dart';

abstract class WeatherRemoteDataSource {
  Future<ApiResultModel<WeatherInfoResponseModel?>> getWeatherDataByCoordinate(
      {WeatherByCoordinateRequestModel? weatherByCoordinateRequestModel});

  Future<ApiResultModel<WeatherInfoResponseModel>> getWeatherDataByCity(
      {String? cityName});
}
