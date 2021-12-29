import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_peoject/shared/style/colors.dart';

customDarkMode() {
  return ThemeData.dark().copyWith(
    scaffoldBackgroundColor: darkModeMainColor,
    colorScheme: ColorScheme.light(
        primary: darkModeSecondaryColor, onPrimary: Colors.white),
    canvasColor: darkModeMainColor,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: darkModeMainColor,
      elevation: 0.0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 0.0,
      backgroundColor: darkModeMainColor,
      selectedItemColor: darkModeSecondaryColor,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
    ),
  );
}
