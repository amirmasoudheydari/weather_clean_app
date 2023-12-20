import 'package:equatable/equatable.dart';

class WindInfoEntity extends Equatable {
  final double? speed;
  final int? deg;

  const WindInfoEntity({required this.speed, required this.deg});

  @override
  List<Object?> get props => [speed, deg];
}
