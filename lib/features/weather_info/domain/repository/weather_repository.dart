import 'package:weather_clean_app/core/commundomain/entities/api_result_model.dart';
import 'package:weather_clean_app/features/weather_info/domain/entities/weather_info_entity.dart';
import 'package:weather_clean_app/features/weather_info/utils/weather_by_coordinate_requeste_model.dart';

abstract class WeatherRepository {
  Future<ApiResultModel<WeatherInfoEntity?>> getWeatherDataByCoordinates(
      {WeatherByCoordinateRequestModel? weatherByCoordinateRequestModel});

  Future<ApiResultModel<WeatherInfoEntity?>> getWeatherDataByCity(
      {String? cityName});

  Future<ApiResultModel<List<WeatherInfoEntity?>?>> getAllLocalWeathers();
}
