import 'package:injectable/injectable.dart';
import 'package:weather_clean_app/core/di/app_component/app_component.dart';
import 'package:weather_clean_app/core/utils/helpers/app_flavors_helper/app_flavors_helper.dart';
import 'package:weather_clean_app/core/utils/helpers/app_theme_helpers/custom_theme_data.dart';
import 'package:weather_clean_app/core/utils/values/colors.dart';

@singleton
class AppConfiguration {
  String? baseUrl = locator<AppFlavorsHelper>().baseUrl;

  CustomThemeData appTheme = CustomThemeData(
      buttonEnableColor: blue3E97C8,
      buttonDisableColor: blueD8E7F2,
      primaryColor: blue203C6F,
      validColor: green27B15F,
      secondaryColor: blue3E97C8,
      thirdColor: blueD8E7F2,
      backgroundLightColor: white,
      backgroundGreyColor: greyE5E5EA,
      errorColor: redCF3A3A,
      loaderColor: blue203C6F,
      titleTextColor: black101010,
      subTitleTextColor: black404040);
}
