import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_clean_app/core/utils/mapper/data_mapper.dart';

import '../../../domain/entities/weather_remote_info_response_entity/wind_info_entity.dart';

part 'wind_info_response_model.g.dart';

@JsonSerializable()
class WindInfoResponseModel extends DataMapper<WindInfoEntity> {
  final double? speed;
  final int? deg;

  WindInfoResponseModel(this.speed, this.deg);

  factory WindInfoResponseModel.fromJson(Map<String, dynamic> json) =>
      _$WindInfoResponseModelFromJson(json);

  @override
  WindInfoEntity mapToEntity() {
    return WindInfoEntity(speed: speed ?? 0.0, deg: deg ?? 0);
  }
}
