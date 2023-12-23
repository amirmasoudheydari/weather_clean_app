// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:weather_clean_app/core/utils/helpers/api_call_helper/api_call_helper.dart'
    as _i10;
import 'package:weather_clean_app/core/utils/helpers/app_configuration_helper/app_configuration_helper.dart'
    as _i3;
import 'package:weather_clean_app/core/utils/helpers/app_flavors_helper/app_flavors_helper.dart'
    as _i4;
import 'package:weather_clean_app/core/utils/helpers/connectivity_helper/connectivity_checker_helper.dart'
    as _i5;
import 'package:weather_clean_app/core/utils/helpers/http_strategy_helper/http_request_context.dart'
    as _i9;
import 'package:weather_clean_app/features/weather_info/domain/repository/weather_repository.dart'
    as _i7;
import 'package:weather_clean_app/features/weather_info/domain/usecases/get_weather_data_by_citiy.dart'
    as _i6;
import 'package:weather_clean_app/features/weather_info/domain/usecases/get_weather_data_by_coordinates.dart'
    as _i8;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.AppConfiguration>(_i3.AppConfiguration());
    gh.singleton<_i4.AppFlavorsHelper>(_i4.AppFlavorsHelper());
    gh.factory<_i5.ConnectivityCheckerHelper>(
        () => _i5.ConnectivityCheckerHelper());
    gh.factory<_i6.GetWeatherDataByCity>(
        () => _i6.GetWeatherDataByCity(gh<_i7.WeatherRepository>()));
    gh.factory<_i8.GetWeatherDataByCoordinate>(
        () => _i8.GetWeatherDataByCoordinate(gh<_i7.WeatherRepository>()));
    gh.factory<_i9.HttpRequestContext>(
        () => _i9.HttpRequestContext(gh<_i5.ConnectivityCheckerHelper>()));
    gh.factory<_i10.ApiCallHelper>(
        () => _i10.ApiCallHelper(gh<_i5.ConnectivityCheckerHelper>()));
    return this;
  }
}
