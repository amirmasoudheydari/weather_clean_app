import 'package:objectbox/objectbox.dart';
import 'package:weather_clean_app/core/utils/mapper/data_mapper.dart';

import '../weather_remote_info_response_entity/sunset_sunrise_entity.dart';

@Entity()
class SunsetSunriseLocalEntity extends DataMapper<SunsetSunriseEntity> {
  final int? type;
  @Id()
   int id;
  final String? country;
  final int? sunrise;
  final int? sunset;

  SunsetSunriseLocalEntity(
      {this.type, required this.id, this.country, this.sunrise, this.sunset});

  @override
  SunsetSunriseEntity mapToEntity() {
    return SunsetSunriseEntity(
        type: type, id: id, country: country, sunrise: sunrise, sunset: sunset);
  }
}
