// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_weather_info_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MainWeatherInfoResponseModel _$MainWeatherInfoResponseModelFromJson(
        Map<String, dynamic> json) =>
    MainWeatherInfoResponseModel(
      (json['temp'] as num?)?.toDouble(),
      (json['feels_like'] as num?)?.toDouble(),
      (json['temp_min'] as num?)?.toDouble(),
      (json['temp_max'] as num?)?.toDouble(),
      json['pressure'] as int?,
      json['humidity'] as int?,
    );

Map<String, dynamic> _$MainWeatherInfoResponseModelToJson(
        MainWeatherInfoResponseModel instance) =>
    <String, dynamic>{
      'temp': instance.temp,
      'feels_like': instance.feelsLike,
      'temp_min': instance.tempMin,
      'temp_max': instance.tempMax,
      'pressure': instance.pressure,
      'humidity': instance.humidity,
    };
