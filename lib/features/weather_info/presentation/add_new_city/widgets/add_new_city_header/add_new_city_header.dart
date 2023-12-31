import 'package:flutter/material.dart';
import 'package:weather_clean_app/core/basecomponents/base_responsive_widget.dart';
import 'package:weather_clean_app/core/utils/helpers/extension_function/size_extension.dart';

import '../../../../../../core/utils/values/styles.dart';

class AddNewCityHeaderWidget extends StatelessWidget {
  const AddNewCityHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseResponsiveWidget(
        buildWidget: (context, responsiveUiConfig, appConfiguration) {
      return Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
        IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back,
                color: appConfiguration.appTheme.primaryColor)),
        Text("Manage cities",
            style: poppinsMedium.copyWith(
                color: appConfiguration.appTheme.primaryColor, fontSize: 20.w))
      ]);
    });
  }
}
