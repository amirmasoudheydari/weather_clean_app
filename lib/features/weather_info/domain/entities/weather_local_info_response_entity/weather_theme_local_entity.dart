import 'dart:ui';

import 'package:objectbox/objectbox.dart';
import 'package:weather_clean_app/core/utils/mapper/data_mapper.dart';
import 'package:weather_clean_app/features/weather_info/domain/entities/weather_remote_info_response_entity/weather_theme_entity.dart';

@Entity()
class WeatherThemeLocalEntity extends DataMapper<WeatherThemeEntity> {
  WeatherThemeLocalEntity({this.firstColor, this.secondColor, required this.id});

  Color? firstColor;
  Color? secondColor;
  @Id()
   int id;

  @override
  WeatherThemeEntity mapToEntity() {
    return WeatherThemeEntity(firstColor: firstColor, secondColor: secondColor);
  }
}
