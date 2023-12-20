// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sunset_sunrise_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SunsetSunriseResponseModel _$SunsetSunriseResponseModelFromJson(
        Map<String, dynamic> json) =>
    SunsetSunriseResponseModel(
      json['type'] as int?,
      json['id'] as int?,
      json['country'] as String?,
      json['sunrise'] as int?,
      json['sunset'] as int?,
    );

Map<String, dynamic> _$SunsetSunriseResponseModelToJson(
        SunsetSunriseResponseModel instance) =>
    <String, dynamic>{
      'type': instance.type,
      'id': instance.id,
      'country': instance.country,
      'sunrise': instance.sunrise,
      'sunset': instance.sunset,
    };
