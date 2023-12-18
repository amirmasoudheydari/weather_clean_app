import 'package:injectable/injectable.dart';
import 'package:weather_clean_app/core/commundomain/entities/api_result_model.dart';
import 'package:weather_clean_app/core/commundomain/usecases/use_case.dart';
import 'package:weather_clean_app/features/weather_info/domain/entities/weather_info_entity.dart';
import 'package:weather_clean_app/features/weather_info/domain/repository/weather_repository.dart';

@injectable
class GetWeatherDataByCity implements UseCase<WeatherInfoEntity?, String> {
  final WeatherRepository weatherRepository;

  GetWeatherDataByCity(this.weatherRepository);

  @override
  Future<ApiResultModel<WeatherInfoEntity?>> call(String cityName) {
    return weatherRepository.getWeatherDataByCity(cityName: cityName);
  }
}
