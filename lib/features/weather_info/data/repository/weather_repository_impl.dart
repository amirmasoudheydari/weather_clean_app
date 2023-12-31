import 'package:injectable/injectable.dart';
import 'package:weather_clean_app/core/commundomain/entities/api_result_model.dart';
import 'package:weather_clean_app/features/weather_info/data/datasource/remote_datasource/weather_remote_datasource.dart';
import 'package:weather_clean_app/features/weather_info/data/models/weather_info_remote_response_model/weather_info_response_model.dart';
import 'package:weather_clean_app/features/weather_info/domain/entities/weather_remote_info_response_entity/weather_info_entity.dart';
import 'package:weather_clean_app/features/weather_info/domain/repository/weather_repository.dart';
import 'package:weather_clean_app/features/weather_info/utils/weather_by_coordinate_requeste_model.dart';

import '../../../../core/commundomain/entities/error_result_model.dart';
import '../../../../core/utils/helpers/custom_exceptions/custom_connection_exception.dart';
import '../datasource/local_datasource/weather_local_datasource.dart';

@Injectable(as: WeatherRepository)
class WeatherRepositoryImpl implements WeatherRepository {
  const WeatherRepositoryImpl(
      {required this.remoteDataSource, required this.localDataSource});

  final WeatherRemoteDataSource remoteDataSource;
  final WeatherLocalDataSource localDataSource;

  @override
  Future<ApiResultModel<WeatherInfoEntity?>> getWeatherDataByCity(
      {String? cityName}) async {
    try {
      final ApiResultModel<WeatherInfoResponseModel?> result =
          await remoteDataSource.getWeatherDataByCity(cityName: cityName);

      return result.when(
          success: (WeatherInfoResponseModel? weatherInfoResponseModel) async {
        if (weatherInfoResponseModel != null) {
          _catchLocalData(weatherInfoResponseModel);
        }

        return ApiResultModel<WeatherInfoEntity?>.success(
            data: weatherInfoResponseModel?.mapToEntity());
      }, failure: (ErrorResultModel errorResultModel) {
        return ApiResultModel<WeatherInfoEntity>.failure(
            errorResultEntity: errorResultModel);
      });
    } on CustomConnectionException catch (_) {
      final ApiResultModel<WeatherInfoEntity?> _result =
          await _getLastLocalWeatherInfo();
      return _result;
    }
  }

  Future<ApiResultModel<WeatherInfoEntity?>> _getLastLocalWeatherInfo() async {
    final WeatherInfoEntity _localResult =
        await localDataSource.getLastWeatherInfo();
    return ApiResultModel<WeatherInfoEntity?>.success(data: _localResult);
  }

  @override
  Future<ApiResultModel<WeatherInfoEntity?>> getWeatherDataByCoordinates(
      {WeatherByCoordinateRequestModel?
          weatherByCoordinateRequestModel}) async {
    try {
      final ApiResultModel<WeatherInfoResponseModel?> _result =
          await remoteDataSource.getWeatherDataByCoordinate(
              weatherByCoordinateRequestModel: weatherByCoordinateRequestModel);

      return _result.when(
          success: (WeatherInfoResponseModel? weatherInfoResponseModel) async {
        if (weatherInfoResponseModel != null) {
          _catchLocalData(weatherInfoResponseModel);
        }

        return ApiResultModel<WeatherInfoEntity?>.success(
            data: weatherInfoResponseModel?.mapToEntity());
      }, failure: (ErrorResultModel errorResultModel) {
        return ApiResultModel<WeatherInfoEntity>.failure(
            errorResultEntity: errorResultModel);
      });
    } on CustomConnectionException catch (_) {
      final ApiResultModel<WeatherInfoEntity?> _result =
          await _getLastLocalWeatherInfo();

      return _result;
    }
  }

  void _catchLocalData(WeatherInfoResponseModel? weatherData) {
    localDataSource.catchWeatherInfo(weatherData);
  }

  @override
  Future<ApiResultModel<List<WeatherInfoEntity?>?>>
      getAllLocalWeathers() async {
    final List<WeatherInfoEntity?>? _result =
        await localDataSource.getAllLocalWeathers();

    return ApiResultModel<List<WeatherInfoEntity?>?>.success(data: _result);
  }
}
