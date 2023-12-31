import 'package:equatable/equatable.dart';
import 'package:weather_clean_app/features/weather_info/domain/entities/weather_remote_info_response_entity/clouds_entity.dart';
import 'package:weather_clean_app/features/weather_info/domain/entities/weather_remote_info_response_entity/weather_description_entity.dart';
import 'package:weather_clean_app/features/weather_info/domain/entities/weather_remote_info_response_entity/weather_theme_entity.dart';

import 'main_weather_entity.dart';
import 'sunset_sunrise_entity.dart';
import 'wind_info_entity.dart';

class WeatherInfoEntity extends Equatable {
  final List<WeatherDescriptionEntity?>? weather;
  final MainWeatherInfoEntity? main;
  final String? visibility;

  final WindInfoEntity? wind;

  final CloudsEntity? clouds;
  final String? dt;
  final SunsetSunriseEntity? sys;
  final int? timeZone;
  final int? id;
  final String? name;
  final WeatherThemeEntity? weatherTheme;

  const WeatherInfoEntity(
      {this.weather,
      this.main,
      this.visibility,
      this.wind,
      this.clouds,
      this.dt,
      this.sys,
      this.id,
      this.name,
      this.timeZone,
      this.weatherTheme});

  @override
  List<Object?> get props => [
        weather,
        main,
        visibility,
        wind,
        clouds,
        dt,
        sys,
        id,
        name,
        timeZone,
        weatherTheme
      ];
}
