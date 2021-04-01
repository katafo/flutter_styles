import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_fonts.dart';

abstract class AppStyles {
  ThemeData getThemeData();

  TextStyle getTextStyle({TextStyle customStyle});

  List<Color> getLinearGradientColor();

  Color getDotStyle();

  Color getToggleBackgroundColor();

  Color getToggleButtonColor();

  List<BoxShadow> getToggleButtonShadow();

  Color getSunColor();
}

class DefaultStyles implements AppStyles {
  @override
  TextStyle getTextStyle({TextStyle customStyle}) {
    return TextStyle().merge(customStyle);
  }

  @override
  ThemeData getThemeData() {
    return ThemeData(
        fontFamily: AppFonts.openSans,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primarySwatch: AppColors.grey,
        primaryColor: AppColors.white,
        brightness: Brightness.light,
        backgroundColor: Color(0xFFFFFFFF),
        scaffoldBackgroundColor: Color(0xFFFFFFFF));
  }

  @override
  List<Color> getLinearGradientColor() {
    return [Color(0xDDFF0080), Color(0xDDFF8C00)];
  }

  @override
  Color getDotStyle() {
    return AppColors.closeShutter;
  }

  @override
  Color getToggleBackgroundColor() {
    return AppColors.placebo;
  }

  @override
  Color getToggleButtonColor() {
    return AppColors.white;
  }

  @override
  List<BoxShadow> getToggleButtonShadow() => [
        BoxShadow(
            color: Color(0xFFd8d7da),
            spreadRadius: 5,
            blurRadius: 10,
            offset: Offset(0, 5)),
      ];

  @override
  Color getSunColor() {
    return AppColors.white;
  }
}

class DarkStyles implements AppStyles {
  @override
  TextStyle getTextStyle({TextStyle customStyle}) {
    return TextStyle().merge(customStyle);
  }

  @override
  ThemeData getThemeData() {
    return ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      primarySwatch: AppColors.grey,
      primaryColor: AppColors.satinDepBlack,
      brightness: Brightness.dark,
      backgroundColor: AppColors.closeShutter,
      scaffoldBackgroundColor: AppColors.closeShutter,
    );
  }

  @override
  Color getDotStyle() {
    return AppColors.white;
  }

  @override
  List<Color> getLinearGradientColor() {
    return [AppColors.lavenderBlueShadow, AppColors.malmoFF];
  }

  @override
  Color getSunColor() {
    return AppColors.closeShutter;
  }

  @override
  Color getToggleBackgroundColor() {
    return AppColors.raisinBlack;
  }

  @override
  Color getToggleButtonColor() {
    return AppColors.witchesCauldron;
  }

  @override
  List<BoxShadow> getToggleButtonShadow() {
    return [
      BoxShadow(
          color: Color(0x66000000),
          spreadRadius: 5,
          blurRadius: 10,
          offset: Offset(0, 5))
    ];
  }
}
