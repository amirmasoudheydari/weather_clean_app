import 'package:json_annotation/json_annotation.dart';
import 'package:weather_clean_app/core/utils/helpers/extension_function/extension_function.dart';
import 'package:weather_clean_app/core/utils/mapper/data_mapper.dart';
import 'package:weather_clean_app/features/weather_info/data/models/weather_info_remote_response_model/cloud_response_model.dart';
import 'package:weather_clean_app/features/weather_info/data/models/weather_info_remote_response_model/coordinate_response_model.dart';
import 'package:weather_clean_app/features/weather_info/data/models/weather_info_remote_response_model/main_weather_info_response_model.dart';
import 'package:weather_clean_app/features/weather_info/data/models/weather_info_remote_response_model/sunset_sunrise_response_model.dart';
import 'package:weather_clean_app/features/weather_info/data/models/weather_info_remote_response_model/weather_description_response_model.dart';
import 'package:weather_clean_app/features/weather_info/data/models/weather_info_remote_response_model/wind_info_response_model.dart';
import 'package:weather_clean_app/features/weather_info/domain/entities/weather_remote_info_response_entity/clouds_entity.dart';
import 'package:weather_clean_app/features/weather_info/domain/entities/weather_remote_info_response_entity/weather_description_entity.dart';
import 'package:weather_clean_app/features/weather_info/utils/weather_type_enum.dart';

import '../../../domain/entities/weather_remote_info_response_entity/main_weather_entity.dart';
import '../../../domain/entities/weather_remote_info_response_entity/sunset_sunrise_entity.dart';
import '../../../domain/entities/weather_remote_info_response_entity/weather_info_entity.dart';

part 'weather_info_response_model.g.dart';

@JsonSerializable()
class WeatherInfoResponseModel extends DataMapper<WeatherInfoEntity> {
  @JsonKey(name: 'coord')
  CoordinateResponseModel? coordinateData;
  @JsonKey(name: 'weather')
  List<WeatherDescriptionResponseModel>? weatherDescription;
  MainWeatherInfoResponseModel? mainWeatherData;
  @JsonKey(name: 'visibility')
  int? weatherVisibility;
  @JsonKey(name: 'wind')
  WindInfoResponseModel? windData;
  @JsonKey(name: 'clouds')
  CloudResponseModel? cloudData;
  @JsonKey(name: 'dt')
  int? date;
  @JsonKey(name: 'sys')
  SunsetSunriseResponseModel? sunsetAndSunriseData;
  int? timeZone;
  int? id;
  @JsonKey(name: 'name')
  String? cityName;

  WeatherInfoResponseModel({
    this.coordinateData,
    this.weatherDescription,
    this.mainWeatherData,
    this.weatherVisibility,
    this.windData,
    this.cloudData,
    this.sunsetAndSunriseData,
    this.timeZone,
    this.id,
    this.cityName,
  });

  factory WeatherInfoResponseModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherInfoResponseModelFromJson(json);

  @override
  mapToEntity() {
    final List<WeatherDescriptionEntity>? _weatherDescription =
        weatherDescription
            ?.map((WeatherDescriptionResponseModel weatherDescriptionEntity) =>
                weatherDescriptionEntity.mapToEntity())
            .toList();

    final WeatherTypeEnum? weatherTypeEnum =
        _weatherDescription?[0].main?.toWeatherType();

    return WeatherInfoEntity(
        weather: _weatherDescription,
        main: mainWeatherData?.mapToEntity() ?? const MainWeatherInfoEntity(),
        visibility: '3',
        wind: windData?.mapToEntity(),
        clouds: cloudData?.mapToEntity() ?? const CloudsEntity(),
        dt: date?.fromTimestampToDate(),
        sys: sunsetAndSunriseData?.mapToEntity() ?? const SunsetSunriseEntity(),
        id: id ?? 0,
        name: cityName ?? '',
        timeZone: timeZone);
  }
}
