import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mentorship_b1/core/themes/size_manager.dart';
import 'package:flutter_mentorship_b1/core/themes/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    primarySwatch: ColorsManager.themeColor,
    primaryColor: ColorsManager.primary,
    primaryColorLight: ColorsManager.primary,
    primaryColorDark: ColorsManager.primary,
    scaffoldBackgroundColor: ColorsManager.black,
    canvasColor: ColorsManager.lightBlack,
    appBarTheme:  AppBarTheme(
      iconTheme: const IconThemeData(color: ColorsManager.white),
      titleTextStyle: const TextStyle(color: ColorsManager.white),
      elevation: AppSize.s0,
      backgroundColor: ColorsManager.black,
      systemOverlayStyle: const SystemUiOverlayStyle(
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
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color?>(
            (states) => ColorsManager.primary,
          ),
          textStyle: MaterialStateProperty.resolveWith<TextStyle?>(
            (states) => TextStyles.font16Bold,
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppRadius.r10),
            ),
          )),
    ),
  );
}
