import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_clean_app/core/di/app_component/app_component.dart';
import 'package:weather_clean_app/core/utils/helpers/extension_function/size_extension.dart';

import '../../../../../../core/utils/helpers/app_configuration_helper/app_configuration_helper.dart';
import '../../../../../../core/utils/values/styles.dart';

class WeatherSingleInfo extends StatelessWidget {
  final String? infoTitle;
  final String? infoDescription;
  final String? assetString;
  final double? assetSize;

  const WeatherSingleInfo(
      {super.key,
      this.infoTitle,
      this.infoDescription,
      this.assetString,
      this.assetSize});

  @override
  Widget build(BuildContext context) {
    final AppConfiguration appConfiguration = locator<AppConfiguration>();

    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(infoTitle ?? '',
              style: poppinsRegular.copyWith(
                  fontSize: 16.w, color: Colors.white70)),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                if (assetString != null)
                  SvgPicture.asset(assetString!,
                      colorFilter: ColorFilter.mode(
                          appConfiguration.appTheme.primaryColor,
                          BlendMode.srcIn),
                      width: assetSize ?? 20.w),
                Text(infoDescription ?? '',
                    style: poppinsRegular.copyWith(
                        fontSize: 14.w,
                        color: appConfiguration.appTheme.backgroundLightColor))
              ])
        ]);
  }
}
