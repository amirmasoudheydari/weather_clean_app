import 'package:equatable/equatable.dart';

class CoordinateEntity extends Equatable {
  final double? lon;
  final double? lat;

  const CoordinateEntity({this.lon, this.lat});

  @override
  List<Object?> get props => [lon, lat];
}
