import 'package:equatable/equatable.dart';

class MainWeatherInfoEntity extends Equatable {
  final String? temp;
  final double? feelsLike;
  final double? tempMin;
  final double? tempMax;
  final int? pressure;
  final int? humidity;

  const MainWeatherInfoEntity(
      {this.temp,
      this.feelsLike,
      this.tempMin,
      this.tempMax,
      this.pressure,
      this.humidity});

  @override
  List<Object?> get props =>
      <Object?>[temp, feelsLike, tempMin, tempMax, pressure, humidity];
}
