import 'package:objectbox/objectbox.dart';
import 'package:weather_clean_app/core/utils/mapper/data_mapper.dart';
import 'package:weather_clean_app/features/weather_info/domain/entities/weather_remote_info_response_entity/main_weather_entity.dart';

@Entity()
class MainWeatherInfoLocalEntity extends DataMapper<MainWeatherInfoEntity> {
  final String? temp;
  final double? feelsLike;
  final double? tempMin;
  final double? tempMax;
  final int? pressure;
  final int? humidity;

  @Id()
   int id;

  MainWeatherInfoLocalEntity(
      {this.temp,
      this.feelsLike,
      this.tempMin,
      this.tempMax,
      this.pressure,
      this.humidity,
   required   this.id});

  @override
  MainWeatherInfoEntity mapToEntity() {
    return MainWeatherInfoEntity(
        feelsLike: feelsLike,
        humidity: humidity,
        pressure: pressure,
        temp: temp,
        tempMax: tempMax,
        tempMin: tempMin);
  }
}
