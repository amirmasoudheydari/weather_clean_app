import 'package:equatable/equatable.dart';

class WindInfoEntity extends Equatable {
  final int? seed;
  final int? deg;

  const WindInfoEntity({required this.seed, required this.deg});

  @override
  List<Object?> get props => [seed, deg];
}
