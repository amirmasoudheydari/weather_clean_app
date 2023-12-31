import 'package:flutter/material.dart';
import 'package:weather_clean_app/core/di/app_component/app_component.dart';
import 'package:weather_clean_app/core/utils/helpers/extension_function/size_extension.dart';
import 'package:weather_clean_app/core/utils/values/styles.dart';
import 'package:weather_clean_app/features/weather_info/domain/entities/weather_remote_info_response_entity/main_weather_entity.dart';
import 'package:weather_clean_app/features/weather_info/presentation/weather_details/widgets/weather_single_info/weather_single_info.dart';

import '../../../../../../core/utils/helpers/app_configuration_helper/app_configuration_helper.dart';

class WeatherDetailsDataWidget extends StatelessWidget {
  final String? weatherDescription;
  final String? weatherVisibility;
  final MainWeatherInfoEntity? mainWeatherInfoEntity;

  const WeatherDetailsDataWidget(
      {super.key,
      this.weatherDescription,
      this.weatherVisibility,
      this.mainWeatherInfoEntity});

  @override
  Widget build(BuildContext context) {
    final AppConfiguration appConfiguration = locator<AppConfiguration>();
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(weatherDescription ?? '',
              style: poppinsBoldItalic.copyWith(
                  color: appConfiguration.appTheme.primaryColor,
                  fontSize: 16.w)),
          Text(mainWeatherInfoEntity?.temp ?? '',
              style: poppinsBoldItalic.copyWith(
                  color: appConfiguration.appTheme.primaryColor,
                  fontSize: 50.w)),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 25.w),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    WeatherSingleInfo(
                        infoTitle: 'pressure',
                        assetSize: 25.w,
                        assetString: 'assets/pressure_icon.svg',
                        infoDescription: '${mainWeatherInfoEntity?.pressure}'),
                    WeatherSingleInfo(
                        infoTitle: 'visibility',
                        assetSize: 20.w,
                        assetString: 'assets/visibility_icon.svg',
                        infoDescription: weatherVisibility),
                    WeatherSingleInfo(
                        infoTitle: 'Humidity',
                        assetString: 'assets/humidity_icon.svg',
                        infoDescription: '${mainWeatherInfoEntity?.humidity}%')
                  ]))
        ]);
  }
}
