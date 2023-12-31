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
    as _i14;
import 'package:weather_clean_app/core/utils/helpers/app_configuration_helper/app_configuration_helper.dart'
    as _i3;
import 'package:weather_clean_app/core/utils/helpers/app_flavors_helper/app_flavors_helper.dart'
    as _i4;
import 'package:weather_clean_app/core/utils/helpers/connectivity_helper/connectivity_checker_helper.dart'
    as _i5;
import 'package:weather_clean_app/core/utils/helpers/http_strategy_helper/http_request_context.dart'
    as _i6;
import 'package:weather_clean_app/core/utils/helpers/responsive_ui_helper/responsive_config.dart'
    as _i7;
import 'package:weather_clean_app/core/utils/helpers/responsive_ui_helper/test.dart'
    as _i8;
import 'package:weather_clean_app/features/weather_info/data/datasource/local_datasource/weather_local_datasource.dart'
    as _i13;
import 'package:weather_clean_app/features/weather_info/data/datasource/remote_datasource/weather_remote_datasource.dart'
    as _i9;
import 'package:weather_clean_app/features/weather_info/data/datasource/remote_datasource/weather_remote_datasource_impl.dart'
    as _i10;
import 'package:weather_clean_app/features/weather_info/data/repository/weather_repository_impl.dart'
    as _i12;
import 'package:weather_clean_app/features/weather_info/domain/repository/weather_repository.dart'
    as _i11;
import 'package:weather_clean_app/features/weather_info/domain/usecases/get_all_local_weathers.dart'
    as _i15;
import 'package:weather_clean_app/features/weather_info/domain/usecases/get_weather_data_by_citiy.dart'
    as _i16;
import 'package:weather_clean_app/features/weather_info/domain/usecases/get_weather_data_by_coordinates.dart'
    as _i17;
import 'package:weather_clean_app/features/weather_info/presentation/add_new_city/add_new_city_viewmodel.dart'
    as _i19;
import 'package:weather_clean_app/features/weather_info/presentation/weather_details/weather_detailes_viewmodel.dart'
    as _i18;

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
    gh.factory<_i6.HttpRequestContext>(
        () => _i6.HttpRequestContext(gh<_i5.ConnectivityCheckerHelper>()));
    gh.singleton<_i7.ResponsiveUiConfig>(_i7.ResponsiveUiConfig());
    gh.singleton<_i8.ResponsiveUiConfig>(_i8.ResponsiveUiConfig());
    gh.factory<_i9.WeatherRemoteDataSource>(
        () => _i10.WeatherRemoteDataSourceImpl(gh<_i6.HttpRequestContext>()));
    gh.factory<_i11.WeatherRepository>(() => _i12.WeatherRepositoryImpl(
          remoteDataSource: gh<_i9.WeatherRemoteDataSource>(),
          localDataSource: gh<_i13.WeatherLocalDataSource>(),
        ));
    gh.factory<_i14.ApiCallHelper>(
        () => _i14.ApiCallHelper(gh<_i5.ConnectivityCheckerHelper>()));
    gh.factory<_i15.GetAllLocalWeathers>(
        () => _i15.GetAllLocalWeathers(gh<_i11.WeatherRepository>()));
    gh.factory<_i16.GetWeatherDataByCity>(
        () => _i16.GetWeatherDataByCity(gh<_i11.WeatherRepository>()));
    gh.factory<_i17.GetWeatherDataByCoordinate>(
        () => _i17.GetWeatherDataByCoordinate(gh<_i11.WeatherRepository>()));
    gh.factory<_i18.WeatherDetailsViewModel>(() =>
        _i18.WeatherDetailsViewModel(gh<_i17.GetWeatherDataByCoordinate>()));
    gh.factory<_i19.AddNewCityViewModel>(() => _i19.AddNewCityViewModel(
          gh<_i16.GetWeatherDataByCity>(),
          gh<_i15.GetAllLocalWeathers>(),
        ));
    return this;
  }
}
