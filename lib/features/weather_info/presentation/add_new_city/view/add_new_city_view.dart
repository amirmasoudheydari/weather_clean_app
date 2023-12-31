import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:weather_clean_app/core/basecomponents/base_responsive_widget.dart';
import 'package:weather_clean_app/core/basecomponents/base_view_model_view.dart';
import 'package:weather_clean_app/core/utils/helpers/extension_function/extension_function.dart';

import '../../../../../core/commundomain/entities/base_api_result/api_result_state.dart';
import '../../../../../core/commundomain/entities/error_result_model.dart';
import '../../../domain/entities/weather_remote_info_response_entity/weather_info_entity.dart';
import '../add_new_city_viewmodel.dart';
import '../widgets/add_new_city_header/add_new_city_header.dart';

@RoutePage()
class AddNewCityView extends StatefulWidget {
  const AddNewCityView({super.key});

  @override
  State<AddNewCityView> createState() => _AddNewCityViewState();
}

class _AddNewCityViewState extends State<AddNewCityView> {
  final List<WeatherInfoEntity?> _citiesWeatherList = <WeatherInfoEntity?>[];
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  AddNewCityViewModel? _provider;

  bool _checkItemInList() {
    bool _itemFound = false;

    _citiesWeatherList.forEach((WeatherInfoEntity? item) {
      if (_controller.text.isEqual(item?.name)) {
        _itemFound = true;
      }
      return;
    });

    return _itemFound;
  }

  void _listenToNewCityData() {
    _provider?.weatherResult.stream
        .listen((ApiResultState<WeatherInfoEntity?>? result) {
      result?.when(
          data: (WeatherInfoEntity? data) {
            if (!_citiesWeatherList
                .any((WeatherInfoEntity? element) => element?.id == data?.id)) {
              setState(() {
                _citiesWeatherList.add(data);
              });
            }
          },
          error: (ErrorResultModel error) {});
    });
  }

  void _listenToInitialLocalData() {
    _provider?.weatherLocalResult.stream.listen((result) {
      result?.when(
          data: (data) {
            if (data != null) {
              if (!mounted) {
                return;
              }
              setState(() {
                _citiesWeatherList.addAll(data);
              });
            }
          },
          error: (ErrorResultModel error) {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return BaseResponsiveWidget(
        buildWidget: (BuildContext context, responsiveUiConfig,
                appConfiguration) =>
            Scaffold(
                backgroundColor: appConfiguration.appTheme.primaryColor,
                body: SafeArea(
                    child: BaseViewModelView<AddNewCityViewModel>(
                        onInitState: (AddNewCityViewModel provider) async {
                  _provider = provider;

                  _listenToInitialLocalData();
                  _listenToNewCityData();

                  await provider.getAllLocalWeathersData();
                }, buildWidget: (AddNewCityViewModel provider) {
                  return ListView.builder(
                      itemCount: _citiesWeatherList.length + 1,
                      itemBuilder: (BuildContext context, int index) {
                        switch (index) {
                          case 0:
                            return const AddNewCityHeaderWidget();

                          default:
                            {
                              // return _citiesWeatherList.isNotEmpty
                              //     ? AddNewCityBoxDetails(
                              //     onClickBox: (WeatherInfoEntity?
                              //     weatherInfoEntity) {
                              //       context.pushRoute(WeatherDetailsView(
                              //           weatherInfoEntity: weatherInfoEntity))
                              //     })
                              //     : null;
                            }
                        }
                      });
                }))));
  }
}
