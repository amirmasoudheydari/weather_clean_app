import 'package:flutter/material.dart';

import '../di/app_component/app_component.dart';
import '../utils/helpers/app_configuration_helper/app_configuration_helper.dart';
import '../utils/helpers/responsive_ui_helper/responsive_config.dart';

class BaseResponsiveWidget extends StatelessWidget {
  const BaseResponsiveWidget(
      {super.key, required this.buildWidget, this.initializeConfig = false});

  final Widget Function(
      BuildContext context,
      ResponsiveUiConfig responsiveUiConfig,
      AppConfiguration appConfiguration) buildWidget;

  final bool initializeConfig;

  @override
  Widget build(BuildContext context) {
    final ResponsiveUiConfig responsiveUiConfig = locator<ResponsiveUiConfig>();
    final AppConfiguration appConfiguration = locator<AppConfiguration>();

    return buildWidget(context, responsiveUiConfig, appConfiguration);
  }
}
