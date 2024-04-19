import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'colors_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    primarySwatch: ColorsManager.themeColor,
    primaryColor: ColorsManager.primary,
    primaryColorLight: ColorsManager.primary,
    primaryColorDark: ColorsManager.primary,
    scaffoldBackgroundColor: ColorsManager.black,
    canvasColor: ColorsManager.lightBlack,
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(color: ColorsManager.white),
      titleTextStyle: TextStyle(color: ColorsManager.white),
      elevation: 0,
      backgroundColor: ColorsManager.black,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarColor: Colors.transparent,
      ),
    ),
    useMaterial3: true,
    iconTheme: const IconThemeData(color: ColorsManager.white),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: ColorsManager.lightBlack,
      labelTextStyle: MaterialStateProperty.resolveWith<TextStyle>(
        (Set<MaterialState> states) => states.contains(MaterialState.selected)
            ? const TextStyle(color: ColorsManager.primary)
            : const TextStyle(color: ColorsManager.white),
      ),
      iconTheme: MaterialStateProperty.resolveWith<IconThemeData>(
        (Set<MaterialState> states) => states.contains(MaterialState.selected)
            ? const IconThemeData(color: ColorsManager.primary)
            : const IconThemeData(color: ColorsManager.white),
      ),
    ),
  );
}
