import 'package:flutter/material.dart';
import 'package:weather_clean_app/core/utils/values/colors.dart';
import 'package:weather_clean_app/features/weather_info/domain/entities/weather_theme_entity.dart';

enum WeatherTypeEnum { thunderstorm, drizzle, rain, snow, clear, clouds, other }

extension WeatherTypeEnumExtension on String? {
  WeatherTypeEnum? toWeatherType() {
    WeatherTypeEnum? value;

    switch (this) {
      case 'thunderstorm':
        value = WeatherTypeEnum.thunderstorm;
        break;

      case 'drizzle':
        value = WeatherTypeEnum.drizzle;
        break;

      case 'rain':
        value = WeatherTypeEnum.rain;
        break;

      case 'snow':
        value = WeatherTypeEnum.snow;
        break;

      case 'clear':
        value = WeatherTypeEnum.clear;
        break;
      case 'clouds':
        value = WeatherTypeEnum.clouds;
        break;

      default:
        value = WeatherTypeEnum.other;
    }

    return value;
  }
}

extension WeatherTypeEnumThemeExtension on WeatherTypeEnum {
  WeatherThemeEntity? toWeatherTheme() {
    WeatherThemeEntity? value;

    switch (this) {
      case WeatherTypeEnum.thunderstorm:
      case WeatherTypeEnum.clouds:
      case WeatherTypeEnum.rain:
        value = WeatherThemeEntity(
            firstColor: blue3E97C8, secondColor: blue3E97C8.withOpacity(0.8));
        break;

      case WeatherTypeEnum.drizzle:
      case WeatherTypeEnum.snow:
        value =
            WeatherThemeEntity(firstColor: blue3E97C8, secondColor: blueD8E7F2);
      case WeatherTypeEnum.clear:
        value = WeatherThemeEntity(
            firstColor: Colors.orange, secondColor: Colors.yellow);
        break;

      default:
        value =
            WeatherThemeEntity(firstColor: blue3E97C8, secondColor: blueD8E7F2);
    }
    return value;
  }
}
