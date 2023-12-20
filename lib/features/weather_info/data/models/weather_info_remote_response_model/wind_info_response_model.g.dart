// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wind_info_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WindInfoResponseModel _$WindInfoResponseModelFromJson(
        Map<String, dynamic> json) =>
    WindInfoResponseModel(
      (json['speed'] as num?)?.toDouble(),
      json['deg'] as int?,
    );

Map<String, dynamic> _$WindInfoResponseModelToJson(
        WindInfoResponseModel instance) =>
    <String, dynamic>{
      'speed': instance.speed,
      'deg': instance.deg,
    };
