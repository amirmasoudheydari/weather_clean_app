import 'package:objectbox/objectbox.dart';
import 'package:weather_clean_app/core/utils/mapper/data_mapper.dart';

import '../weather_remote_info_response_entity/coordinate_entity.dart';

@Entity()
class CoordinateLocalEntity extends DataMapper<CoordinateEntity> {
  final double? lon;
  final double? lat;
  @Id()
   int id;

  CoordinateLocalEntity({this.lon, this.lat, required this.id});

  @override
  CoordinateEntity mapToEntity() {
    return CoordinateEntity(lat: lat, lon: lon);
  }
}
