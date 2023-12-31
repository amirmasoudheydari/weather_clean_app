import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:weather_clean_app/core/basecomponents/base_view_model.dart';
import 'package:weather_clean_app/features/weather_info/domain/entities/weather_remote_info_response_entity/weather_info_entity.dart';

import '../../../../core/commundomain/entities/base_api_result/api_result_state.dart';
import '../../domain/usecases/get_weather_data_by_coordinates.dart';
import '../../utils/weather_by_coordinate_requeste_model.dart';

@injectable
class WeatherDetailsViewModel extends BaseViewModel {
  WeatherDetailsViewModel(this.getWeatherDataByCoordinates);

  final GetWeatherDataByCoordinate getWeatherDataByCoordinates;

  final StreamController<ApiResultState<WeatherInfoEntity?>?> _weatherResult =
      StreamController<ApiResultState<WeatherInfoEntity?>?>.broadcast();

  StreamController<ApiResultState<WeatherInfoEntity?>?> get weatherResult =>
      _weatherResult;

  Future<void> getWeatherByCoordinates(
      {WeatherByCoordinateRequestModel?
          weatherByCoordinateRequestModel}) async {
    final ApiResultState<WeatherInfoEntity?>? _result =
        await executeParamsUseCase(
            usecase: getWeatherDataByCoordinates,
            query: weatherByCoordinateRequestModel);

    _weatherResult.add(_result);
  }

  @override
  void onDispose() {
    super.onDispose();
    _weatherResult.close();
  }
}
