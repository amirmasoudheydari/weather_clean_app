import 'package:equatable/equatable.dart';
import 'package:weather_clean_app/features/weather_info/domain/entities/clouds_eintity.dart';
import 'package:weather_clean_app/features/weather_info/domain/entities/main_weather_eintity.dart';
import 'package:weather_clean_app/features/weather_info/domain/entities/sunset_sunrise_entity.dart';
import 'package:weather_clean_app/features/weather_info/domain/entities/weather_description_entity.dart';
import 'package:weather_clean_app/features/weather_info/domain/entities/wind_info_entity.dart';

// this.weather,
// this.main,
// this.visibility,
// this.wind,
// this.clouds,
// this.dt,
// this.sys,
// this.timezone,
// this.id,
// this.name,
// this.weatherTheme,

class WeatherInfoEntity extends Equatable {
  final List<WeatherEntity?>? weather;
  final List<MainWeatherEntity?>? main;
  final int? visibility;

  final WindInfoEntity? wind;

  final CloudsEntity? clouds;
  final int? dt;
  final SunsetSunriseEntity? sys;
  final int? timeZone;
  final int? id;
  final String? name;

  const WeatherInfoEntity(
      {required this.weather,
      required this.main,
      required this.visibility,
      required this.wind,
      required this.clouds,
      required this.dt,
      required this.sys,
      required this.id,
      required this.name,
      required this.timeZone});

  @override
  List<Object?> get props =>
      [weather, main, visibility, wind, clouds, dt, sys, id, name, timeZone];
}
