import 'package:equatable/equatable.dart';
import 'package:weather_clean_app/features/weather_info/domain/entities/clouds_eintity.dart';
import 'package:weather_clean_app/features/weather_info/domain/entities/main_weather_entitiy.dart';
import 'package:weather_clean_app/features/weather_info/domain/entities/sunset_sunrise_entity.dart';
import 'package:weather_clean_app/features/weather_info/domain/entities/weather_description_entity.dart';
import 'package:weather_clean_app/features/weather_info/domain/entities/wind_info_entity.dart';



class WeatherInfoEntity extends Equatable {
  final List<WeatherDescriptionEntity?>? weather;
  final MainWeatherInfoEntity? main;
  final int? visibility;

  final WindInfoEntity? wind;

  final CloudsEntity? clouds;
  final String? dt;
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
