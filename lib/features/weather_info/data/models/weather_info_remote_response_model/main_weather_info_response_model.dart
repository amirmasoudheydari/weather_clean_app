import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_clean_app/core/utils/mapper/data_mapper.dart';
import 'package:weather_clean_app/features/weather_info/domain/entities/main_weather_entitiy.dart';

part 'main_weather_info_response_model.g.dart';

@JsonSerializable()
class MainWeatherInfoResponseModel extends DataMapper<MainWeatherInfoEntity> {
  final double? temp;

  @JsonKey(name: 'feels_like')
  final double? feelsLike;
  @JsonKey(name: 'temp_min')
  final double? tempMin;
  @JsonKey(name: 'temp_max')
  final double? tempMax;
  final int? pressure;
  final int? humidity;

  MainWeatherInfoResponseModel(this.temp, this.feelsLike, this.tempMin,
      this.tempMax, this.pressure, this.humidity);

  factory MainWeatherInfoResponseModel.fromJson(Map<String, dynamic> json) =>
      _$MainWeatherInfoResponseModelFromJson(json);

  @override
  MainWeatherInfoEntity mapToEntity() {
    return MainWeatherInfoEntity(
        temp: temp.toString() ?? '',
        feelsLike: feelsLike ?? 0.0,
        tempMin: tempMin ?? 0.0,
        tempMax: tempMax ?? 0.0,
        pressure: pressure ?? 0,
        humidity: humidity ?? 0);
  }
}
