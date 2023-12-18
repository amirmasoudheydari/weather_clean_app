import 'package:weather_clean_app/core/commundomain/entities/api_result_model.dart';
import 'package:weather_clean_app/core/commundomain/usecases/use_case.dart';
import 'package:weather_clean_app/features/weather_info/domain/entities/weather_info_entity.dart';
import 'package:weather_clean_app/features/weather_info/domain/repository/weather_repository.dart';

class GetAllLocalWeathers
    implements UseCase<List<WeatherInfoEntity?>?, NoParams> {
  final WeatherRepository repository;

  GetAllLocalWeathers(this.repository);

  @override
  Future<ApiResultModel<List<WeatherInfoEntity?>?>> call(NoParams? params) {
    return repository.getAllLocalWeathers();
  }
}
