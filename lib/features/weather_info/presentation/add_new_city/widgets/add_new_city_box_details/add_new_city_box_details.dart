import 'package:flutter/material.dart';
import 'package:weather_clean_app/core/utils/helpers/extension_function/size_extension.dart';
import 'package:weather_clean_app/core/utils/values/styles.dart';

import '../../../../../../core/basecomponents/base_responsive_widget.dart';
import '../../../../domain/entities/weather_remote_info_response_entity/weather_info_entity.dart';

class AddNewCityBoxDetails extends StatelessWidget {
  final WeatherInfoEntity? weatherInfoEntity;
  final Function(WeatherInfoEntity? weatherInfoEntity)? onClickBox;

  const AddNewCityBoxDetails(
      {super.key, this.weatherInfoEntity, this.onClickBox});

  @override
  Widget build(BuildContext context) {
    return BaseResponsiveWidget(
        buildWidget: (context, responsiveUiConfig, appConfiguration) {
      return GestureDetector(
          onTap: () {
            if (onClickBox != null) {
              onClickBox!(weatherInfoEntity);
            }
          },
          child: Container(
              width: responsiveUiConfig.screenWith,
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              margin: EdgeInsets.all(20.w),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: <Color>[
                      weatherInfoEntity?.weatherTheme?.secondColor ??
                          appConfiguration.appTheme.thirdColor,
                      weatherInfoEntity?.weatherTheme?.firstColor ??
                          appConfiguration.appTheme.secondaryColor
                    ]),
                borderRadius: BorderRadius.all(Radius.circular(20.w)),
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Flexible(
                        flex: 2,
                        child: Text(weatherInfoEntity?.name ?? '',
                            style: poppinsBold.copyWith(
                                color: appConfiguration.appTheme.primaryColor,
                                fontSize: 20.w))),
                    Flexible(
                        flex: 2,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(weatherInfoEntity?.main?.temp ?? '',
                                  style: poppinsRegular.copyWith(
                                      fontSize: 16.w,
                                      color: appConfiguration
                                          .appTheme.primaryColor)),
                              Text(
                                  weatherInfoEntity?.weather?[0]?.description ??
                                      '',
                                  style: poppinsRegular.copyWith(
                                      fontSize: 16.w,
                                      color: appConfiguration
                                          .appTheme.primaryColor))
                            ]))
                  ])));
    });
  }
}
