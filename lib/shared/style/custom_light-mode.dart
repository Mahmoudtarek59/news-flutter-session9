import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_peoject/shared/style/colors.dart';

customLightMode() {
  return ThemeData.light().copyWith(
    scaffoldBackgroundColor: lightModeMainColor,
    colorScheme: ColorScheme.light(
        primary: lightModeSecondaryColor, onPrimary: Colors.black),
    canvasColor: lightModeMainColor,
    appBarTheme: AppBarTheme(
      centerTitle: true,
        color: lightModeMainColor,
        elevation: 0.0,
        systemOverlayStyle:
            SystemUiOverlayStyle(statusBarIconBrightness: Brightness.dark),),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 0.0,
      backgroundColor: lightModeMainColor,
      selectedItemColor: lightModeSecondaryColor,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
    ),
  );
}
