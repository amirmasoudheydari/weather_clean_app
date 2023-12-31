import 'package:objectbox/objectbox.dart';
import 'package:weather_clean_app/core/utils/mapper/data_mapper.dart';
import 'package:weather_clean_app/features/weather_info/domain/entities/weather_remote_info_response_entity/clouds_entity.dart';

@Entity()
class CloudsLocalEntity extends DataMapper<CloudsEntity> {
  final int? all;
  @Id()
   int id;

  CloudsLocalEntity({this.all, required this.id});

  @override
  CloudsEntity mapToEntity() {
    return CloudsEntity(all: all);
  }
}
