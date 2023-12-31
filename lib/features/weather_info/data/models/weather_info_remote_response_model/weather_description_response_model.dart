import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_clean_app/core/utils/mapper/data_mapper.dart';
import 'package:weather_clean_app/features/weather_info/domain/entities/weather_remote_info_response_entity/weather_description_entity.dart';


part 'weather_description_response_model.g.dart';

@JsonSerializable()
class WeatherDescriptionResponseModel
    extends DataMapper<WeatherDescriptionEntity> {
  final int? id;
  final String? main;
  final String? description;
  final String? icon;

  WeatherDescriptionResponseModel(
      this.id, this.main, this.description, this.icon);

  factory WeatherDescriptionResponseModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherDescriptionResponseModelFromJson(json);

  @override
  WeatherDescriptionEntity mapToEntity() {
    return WeatherDescriptionEntity(
        id: id ?? 0,
        main: main ?? '',
        description: description ?? '',
        icon: icon ?? '');
  }
}
