import 'package:injectable/injectable.dart';
import 'package:weather_clean_app/core/commundomain/entities/api_result_model.dart';
import 'package:weather_clean_app/core/commundomain/usecsaes/base_params_usecase.dart';
import 'package:weather_clean_app/features/weather_info/domain/repository/weather_repository.dart';
import 'package:weather_clean_app/features/weather_info/utils/weather_by_coordinate_requeste_model.dart';

import '../entities/weather_remote_info_response_entity/weather_info_entity.dart';

@injectable
class GetWeatherDataByCoordinate
    implements
        BaseParamsUseCase<WeatherInfoEntity?, WeatherByCoordinateRequestModel> {
  final WeatherRepository weatherRepository;

  GetWeatherDataByCoordinate(this.weatherRepository);

  @override
  Future<ApiResultModel<WeatherInfoEntity?>> call(
      WeatherByCoordinateRequestModel? params) {
    return weatherRepository.getWeatherDataByCoordinates(
        weatherByCoordinateRequestModel: params);
  }
}
