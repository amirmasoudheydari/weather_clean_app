import 'package:flutter/material.dart';
import 'package:weather_clean_app/core/basecomponents/base_responsive_widget.dart';
import 'package:weather_clean_app/core/utils/helpers/extension_function/size_extension.dart';

import '../../../../../../core/utils/helpers/app_configuration_helper/app_configuration_helper.dart';
import '../../../../../../core/utils/helpers/responsive_ui_helper/responsive_config.dart';
import '../bottom_navigatioin_bar/bottom_navigation_custom_background.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  final Function()? navigateToAddScreen;

  const BottomNavigationBarWidget({super.key, this.navigateToAddScreen});

  @override
  Widget build(BuildContext context) {
    return BaseResponsiveWidget(buildWidget: (BuildContext context,
        ResponsiveUiConfig responsiveUiConfig,
        AppConfiguration appConfiguration) {
      return Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: <Widget>[
            SizedBox(
                height: 80.w,
                width: responsiveUiConfig.screenWith,
                child: CustomPaint(painter: BottomNavigationCustomBackground()))
          ]);
    });
  }
}
