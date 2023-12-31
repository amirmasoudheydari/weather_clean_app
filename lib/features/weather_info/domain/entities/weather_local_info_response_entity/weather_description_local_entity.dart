import 'package:objectbox/objectbox.dart';
import 'package:weather_clean_app/core/utils/mapper/data_mapper.dart';
import 'package:weather_clean_app/features/weather_info/domain/entities/weather_remote_info_response_entity/weather_description_entity.dart';

@Entity()
class WeatherDescriptionLocalEntity
    extends DataMapper<WeatherDescriptionEntity> {
  @Id()
   int id;
  final String? main;
  final String? description;
  final String? icon;

  WeatherDescriptionLocalEntity(
      {required this.id,
      required this.main,
      required this.description,
      required this.icon});



  @override
  WeatherDescriptionEntity mapToEntity() {
    return WeatherDescriptionEntity(
        id: id, main: main, description: description, icon: icon);
  }
}
