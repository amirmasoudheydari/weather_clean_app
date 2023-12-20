import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_clean_app/core/utils/mapper/data_mapper.dart';
import 'package:weather_clean_app/features/weather_info/domain/entities/clouds_eintity.dart';

part 'cloud_response_model.g.dart';

@JsonSerializable()
class CloudResponseModel extends DataMapper<CloudsEntity> {
  final int? all;

  CloudResponseModel(this.all);

  factory CloudResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CloudResponseModelFromJson(json);

  @override
  CloudsEntity mapToEntity() {
    return CloudsEntity(all: all ?? 0);
  }
}
