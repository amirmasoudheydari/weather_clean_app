import 'package:flutter/material.dart';
import 'package:weather_clean_app/core/di/app_component/app_component.dart';
import 'package:weather_clean_app/core/utils/helpers/app_configuration_helper/app_configuration_helper.dart';
import 'package:weather_clean_app/core/utils/helpers/extension_function/size_extension.dart';

import '../../../../../../core/utils/values/styles.dart';

class WeatherDetailsHeader extends StatelessWidget {
  final String? locationName;
  final String? date;

  const WeatherDetailsHeader({super.key, this.locationName, this.date});

  @override
  Widget build(BuildContext context) {
    final AppConfiguration appConfiguration = locator<AppConfiguration>();

    return Padding(
        padding: EdgeInsets.only(top: 50.w),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(locationName ?? '',
                  style: TextStyle(
                      color: appConfiguration.appTheme.primaryColor,
                      fontSize: 20.w)),
              Text(date ?? '',
                  style: poppinsRegular.copyWith(
                      color: appConfiguration.appTheme.primaryColor,
                      fontSize: 20.w))
            ]));
  }
}
