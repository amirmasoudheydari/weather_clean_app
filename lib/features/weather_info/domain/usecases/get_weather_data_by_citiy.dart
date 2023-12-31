import 'package:injectable/injectable.dart';
import 'package:weather_clean_app/core/commundomain/entities/api_result_model.dart';
import 'package:weather_clean_app/core/commundomain/usecsaes/base_params_usecase.dart';

import '../entities/weather_remote_info_response_entity/weather_info_entity.dart';
import '../repository/weather_repository.dart';

@injectable

class GetWeatherDataByCity
    implements BaseParamsUseCase<WeatherInfoEntity?, String> {
  final WeatherRepository weatherRepository;

  GetWeatherDataByCity(this.weatherRepository);

  @override
  Future<ApiResultModel<WeatherInfoEntity?>> call(String? cityName) {
    return weatherRepository.getWeatherDataByCity(cityName: cityName);
  }
}
