import 'package:equatable/equatable.dart';

class WeatherDescriptionEntity extends Equatable {
  final int? id;
  final String? main;
  final String? description;
  final String? icon;

  const WeatherDescriptionEntity(
      {required this.id,
      required this.main,
      required this.description,
      required this.icon});

  @override
  List<Object?> get props => <Object?>[id, main, description, icon];
}
