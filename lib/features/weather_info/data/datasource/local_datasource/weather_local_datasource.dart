import 'package:injectable/injectable.dart';
import 'package:weather_clean_app/features/weather_info/data/models/weather_info_remote_response_model/weather_info_response_model.dart';

import '../../../domain/entities/weather_remote_info_response_entity/weather_info_entity.dart';

@factoryMethod
abstract class WeatherLocalDataSource {
  Future<WeatherInfoEntity> getLastWeatherInfo();

  Future<List<WeatherInfoEntity?>?> getAllLocalWeathers();

  void catchWeatherInfo(WeatherInfoResponseModel? weatherInfoResponseModel);
}
