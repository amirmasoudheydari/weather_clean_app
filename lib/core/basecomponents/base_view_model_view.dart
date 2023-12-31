import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_clean_app/core/basecomponents/base_responsive_widget.dart';
import 'package:weather_clean_app/core/basecomponents/base_view_model.dart';
import 'package:weather_clean_app/core/utils/helpers/extension_function/size_extension.dart';

import '../utils/constants/app_constants.dart';
import '../utils/helpers/app_configuration_helper/app_configuration_helper.dart';
import '../utils/helpers/connectivity_helper/connectivity_checker_helper.dart';
import '../utils/helpers/responsive_ui_helper/responsive_config.dart';

class BaseViewModelView<T> extends StatefulWidget {
  final void Function(T provider)? onInitState;
  final Widget Function(T provuder) buildWidget;

  const BaseViewModelView(
      {super.key, this.onInitState, required this.buildWidget});

  @override
  State<BaseViewModelView<T>> createState() => _BaseViewModelViewState<T>();
}

class _BaseViewModelViewState<T> extends State<BaseViewModelView<T>> {
  bool _showLoader = false;

  @override
  void initState() {
    super.initState();
    final T _provider = Provider.of<T>(context, listen: false);
  }

  void checkInternetAvailability() {
    ConnectivityCheckerHelper.listenToConnectivityChanged()
        .listen((ConnectivityResult connectivityResult) {
      if (connectivityResult == ConnectivityResult.none) {
        if (!mounted) {
          return;
        }
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text(commonConnectionFailedMessage)));
      }
    });
  }

  void toggleLoadingWidget(T provider) {
    (provider as BaseViewModel).toggleLoading.stream.listen((show) {
      if (!mounted) {
        return;
      }
      setState(() {
        _showLoader = show;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<T>(
        builder: (BuildContext context, T provider, Widget? child) {
      return Stack(alignment: Alignment.center, children: [
        widget.buildWidget(provider),
        if (_showLoader)
          BaseResponsiveWidget(buildWidget: (BuildContext context,
              ResponsiveUiConfig responsiveUiConfig,
              AppConfiguration appConfiguration) {
            return AnimatedOpacity(
                opacity: 1,
                duration: const Duration(milliseconds: 200),
                child: Container(
                    width: responsiveUiConfig.screenWith,
                    height: responsiveUiConfig.screenHeight,
                    color: Colors.transparent,
                    child: Center(
                        child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: appConfiguration.appTheme.primaryColor,
                            ),
                            padding: EdgeInsets.all(15.w),
                            width: 70.w,
                            height: 70.w,
                            child: CircularProgressIndicator(
                                color: appConfiguration
                                    .appTheme.backgroundLightColor)))));
          })
      ]);
    });
  }
}
