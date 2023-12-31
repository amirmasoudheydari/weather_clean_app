import 'package:objectbox/objectbox.dart';
import 'package:weather_clean_app/features/weather_info/domain/entities/weather_remote_info_response_entity/wind_info_entity.dart';

import '../../../../../core/utils/mapper/data_mapper.dart';

@Entity()
class WindInfoLocalEntity extends DataMapper<WindInfoEntity> {
  final double? speed;
  final int? deg;
  @Id()
  int? id;

  WindInfoLocalEntity({required this.speed, required this.deg, this.id});

  @override
  WindInfoEntity mapToEntity() {
    return WindInfoEntity(speed: speed, deg: deg);
  }
}
