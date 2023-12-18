import 'package:equatable/equatable.dart';

class MainWeatherEntity extends Equatable {
  final int? temp;
  final int? feelsLike;
  final int? tempMain;
  final int? tempMax;
  final int? pressure;
  final int? humidity;

  const MainWeatherEntity(
      {required this.temp,
      required this.feelsLike,
      required this.tempMain,
      required this.tempMax,
      required this.pressure,
      required this.humidity});

  @override
  List<Object?> get props =>
      <Object?>[temp, feelsLike, tempMain, tempMax, pressure, humidity];
}
