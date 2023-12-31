import 'package:injectable/injectable.dart';
import 'package:weather_clean_app/core/commundomain/entities/api_result_model.dart';
import 'package:weather_clean_app/core/commundomain/usecsaes/base_params_usecase.dart';
import 'package:weather_clean_app/features/weather_info/domain/repository/weather_repository.dart';

import '../entities/weather_remote_info_response_entity/weather_info_entity.dart';

@injectable
class GetAllLocalWeathers
    implements BaseParamsUseCase<List<WeatherInfoEntity?>?, NoParams> {
  final WeatherRepository repository;

  GetAllLocalWeathers(this.repository);

  @override
  Future<ApiResultModel<List<WeatherInfoEntity?>?>> call(NoParams? params) {
    return repository.getAllLocalWeathers();
  }
}
