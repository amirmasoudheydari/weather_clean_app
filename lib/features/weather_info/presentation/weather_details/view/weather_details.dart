import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_clean_app/core/basecomponents/base_responsive_widget.dart';
import 'package:weather_clean_app/core/basecomponents/base_view_model_view.dart';
import 'package:weather_clean_app/core/utils/helpers/extension_function/size_extension.dart';
import 'package:weather_clean_app/features/weather_info/domain/entities/weather_remote_info_response_entity/weather_info_entity.dart';
import 'package:weather_clean_app/features/weather_info/presentation/add_new_city/view/add_new_city_view.dart';
import 'package:weather_clean_app/features/weather_info/presentation/weather_details/widgets/bottom_navigation_bar_widget/bottom_navigation_bar_widget.dart';
import 'package:weather_clean_app/features/weather_info/presentation/weather_details/widgets/weather_details_data_widget/weather_details_data_widget.dart';
import 'package:weather_clean_app/features/weather_info/presentation/weather_details/widgets/weather_details_headers/weather_details_headers.dart';
import 'package:weather_clean_app/features/weather_info/utils/weather_by_coordinate_requeste_model.dart';

import '../../../../../core/commundomain/entities/base_api_result/api_result_state.dart';
import '../../../../../core/commundomain/entities/error_result_model.dart';
import '../../../../../core/utils/helpers/app_configuration_helper/app_configuration_helper.dart';
import '../../../../../core/utils/helpers/responsive_ui_helper/responsive_config.dart';
import '../weather_detailes_viewmodel.dart';

@RoutePage()
class WeatherDetailsView extends StatefulWidget {
  final WeatherInfoEntity? weatherInfoEntity;

  const WeatherDetailsView({super.key, this.weatherInfoEntity});

  @override
  State<WeatherDetailsView> createState() => _WeatherDetailsViewState();
}

class _WeatherDetailsViewState extends State<WeatherDetailsView> {
  WeatherInfoEntity? _result;
  bool? _isSuccess;

  Future<void> _getWeatherData(WeatherDetailsViewModel provider) async {
    await provider.getWeatherByCoordinates(
        weatherByCoordinateRequestModel: const WeatherByCoordinateRequestModel(
            lon: 10.634422, lat: 35.8214330));
  }

  Widget _getWidget(ResponsiveUiConfig responsiveUiConfig) {
    if (_isSuccess == false) {
      return ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) {
            return SizedBox(
                height: responsiveUiConfig.screenHeight,
                child: Center(
                    child: Lottie.asset('assets/lottie_animation.json')));
          });
    } else {
      return Container();
    }
  }

  @override
  void initState() {
    super.initState();

    if (widget.weatherInfoEntity != null) {
      _result = widget.weatherInfoEntity;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: BaseViewModelView<WeatherDetailsViewModel>(
      onInitState: (WeatherDetailsViewModel provider) async {
        provider.weatherResult.stream
            .listen((ApiResultState<WeatherInfoEntity?>? result) {
          result?.when(data: (WeatherInfoEntity? data) {
            if (!mounted) {
              return;
            }

            setState(() {
              _result = data;
              _isSuccess = data != null;
            });
          }, error: (ErrorResultModel error) {
            print(error);
          });
        });

        if (widget.weatherInfoEntity == null) {
          await _getWeatherData(provider);
        }
      },
      buildWidget: (WeatherDetailsViewModel provider) {
        return BaseResponsiveWidget(buildWidget: (BuildContext context,
            ResponsiveUiConfig responsiveUiConfig,
            AppConfiguration appConfiguration) {
          return RefreshIndicator(
              backgroundColor: appConfiguration.appTheme.backgroundLightColor,
              color: appConfiguration.appTheme.primaryColor,
              strokeWidth: 2.w,
              onRefresh: () async {
                _getWeatherData(provider);
              },
              child:
                  Stack(alignment: Alignment.bottomCenter, children: <Widget>[
                if (_result != null)
                  Container(
                      width: responsiveUiConfig.screenWith,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: <Color>[
                            _result?.weatherTheme?.secondColor ??
                                appConfiguration.appTheme.secondaryColor,
                            _result?.weatherTheme?.firstColor ??
                                appConfiguration.appTheme.thirdColor
                          ])),
                      child: ListView.builder(
                          itemCount: 5,
                          primary: false,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            switch (index) {
                              case 0:
                                {
                                  return WeatherDetailsHeader(
                                      locationName: _result?.name,
                                      date: _result?.dt);
                                }

                              case 1:
                                return Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 20.h),
                                        child: Image.asset(
                                            'assets/${_result?.weather?[0]?.icon}.png',
                                            width: 150.w,
                                            height: 150.w,
                                            alignment: Alignment.center)));

                              case 2:
                                {
                                  return WeatherDetailsDataWidget(
                                      weatherDescription:
                                          _result?.weather?[0]?.description,
                                      weatherVisibility: _result?.visibility,
                                      mainWeatherInfoEntity: _result?.main);
                                }

                              default:
                                return SizedBox(height: 90.h);
                            }
                          }))
                else
                  _getWidget(responsiveUiConfig),
                Positioned(
                    bottom: 0,
                    child: BottomNavigationBarWidget(navigateToAddScreen: () {
                      context
                          .pushRoute(const AddNewCityView() as PageRouteInfo);
                    }))
              ]));
        });
      },
    )));
  }
}
