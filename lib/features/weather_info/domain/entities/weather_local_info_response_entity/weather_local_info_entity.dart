import 'package:objectbox/objectbox.dart';
import 'package:weather_clean_app/core/utils/mapper/data_mapper.dart';
import 'package:weather_clean_app/features/weather_info/domain/entities/weather_local_info_response_entity/clouds_local_entity.dart';
import 'package:weather_clean_app/features/weather_info/domain/entities/weather_local_info_response_entity/main_weather_info_local_entity.dart';
import 'package:weather_clean_app/features/weather_info/domain/entities/weather_local_info_response_entity/sunset_sunrise_local_entity.dart';
import 'package:weather_clean_app/features/weather_info/domain/entities/weather_remote_info_response_entity/weather_info_entity.dart';

import 'weather_description_local_entity.dart';
import 'wind_info_local_entity.dart';

@Entity()
class WeatherInfoLocalEntity extends DataMapper<WeatherInfoEntity> {
  final ToMany<WeatherDescriptionLocalEntity> weather =
      ToMany<WeatherDescriptionLocalEntity>();
  final ToOne<MainWeatherInfoLocalEntity> main =
      ToOne<MainWeatherInfoLocalEntity>();
  int? visibility;

  final ToOne<WindInfoLocalEntity> wind = ToOne<WindInfoLocalEntity>();

  final ToOne<CloudsLocalEntity> clouds = ToOne<CloudsLocalEntity>();
  String? dt;
  ToOne<SunsetSunriseLocalEntity> sys = ToOne<SunsetSunriseLocalEntity>();
  int? timeZone;
  @Id()
  int? id;
  String? name;

  WeatherInfoLocalEntity(
      {this.visibility, this.dt, this.timeZone, this.id, this.name});

  @override
  WeatherInfoEntity mapToEntity() {
    return WeatherInfoEntity(
        weather: weather
            .map((WeatherDescriptionLocalEntity element) =>
                element.mapToEntity())
            .toList(),
        main: main.target?.mapToEntity(),
        visibility: visibility.toString(),
        wind: wind.target?.mapToEntity(),
        clouds: clouds.target?.mapToEntity(),
        dt: dt,
        sys: sys.target?.mapToEntity(),
        id: id,
        name: name,
        timeZone: timeZone);
  }
}
