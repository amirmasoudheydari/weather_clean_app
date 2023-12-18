import 'package:injectable/injectable.dart';
import 'package:weather_clean_app/core/commundomain/entities/api_result_model.dart';
import 'package:weather_clean_app/core/commundomain/usecases/use_case.dart';
import 'package:weather_clean_app/features/weather_info/domain/entities/weather_info_entity.dart';
import 'package:weather_clean_app/features/weather_info/domain/repository/weather_repository.dart';
import 'package:weather_clean_app/features/weather_info/utils/weather_by_coordinate_requeste_model.dart';

@injectable
class GetWeatherDataByCoordinate
    implements UseCase<WeatherInfoEntity?, WeatherByCoordinateRequestModel> {
  final WeatherRepository weatherRepository;

  GetWeatherDataByCoordinate(this.weatherRepository);

  @override
  Future<ApiResultModel<WeatherInfoEntity?>> call(
      WeatherByCoordinateRequestModel params) {
    return weatherRepository.getWeatherDataByCoordinates(
        weatherByCoordinateRequestModel: params);
  }
}
