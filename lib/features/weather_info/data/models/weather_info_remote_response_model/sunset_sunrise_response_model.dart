import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_clean_app/core/utils/mapper/data_mapper.dart';

import '../../../domain/entities/weather_remote_info_response_entity/sunset_sunrise_entity.dart';

part 'sunset_sunrise_response_model.g.dart';

@JsonSerializable()
class SunsetSunriseResponseModel extends DataMapper<SunsetSunriseEntity> {
  final int? type;
  final int? id;
  final String? country;
  final int? sunrise;
  final int? sunset;

  SunsetSunriseResponseModel(
      this.type, this.id, this.country, this.sunrise, this.sunset);

  factory SunsetSunriseResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SunsetSunriseResponseModelFromJson(json);

  @override
  SunsetSunriseEntity mapToEntity() {
    return SunsetSunriseEntity(
        type: type ?? 0,
        id: id ?? 0,
        country: country ?? '',
        sunrise: sunrise ?? 0,
        sunset: sunset ?? 0);
  }
}
