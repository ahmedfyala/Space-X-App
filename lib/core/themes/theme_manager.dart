import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mentorship_b1/core/themes/size_manager.dart';
import 'package:flutter_mentorship_b1/core/themes/styles.dart';

import 'colors_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
      primarySwatch: ColorsManager.themeColor,
      primaryColor: ColorsManager.primary,
      primaryColorLight: ColorsManager.primary,
      primaryColorDark: ColorsManager.primary,
      scaffoldBackgroundColor: ColorsManager.black,
      canvasColor: ColorsManager.lightBlack,
      appBarTheme: AppBarTheme(
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
        labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>(
          (Set<WidgetState> states) => states.contains(WidgetState.selected)
              ? const TextStyle(color: ColorsManager.primary)
              : const TextStyle(color: ColorsManager.white),
        ),
        iconTheme: WidgetStateProperty.resolveWith<IconThemeData>(
          (Set<WidgetState> states) => states.contains(WidgetState.selected)
              ? const IconThemeData(color: ColorsManager.primary)
              : const IconThemeData(color: ColorsManager.white),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            backgroundColor: WidgetStateProperty.resolveWith<Color?>(
              (states) => ColorsManager.primary,
            ),
            textStyle: WidgetStateProperty.resolveWith<TextStyle?>(
              (states) => TextStyles.font16Bold,
            ),
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppRadius.r10),
              ),
            )),
      ),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: EdgeInsets.all(AppPadding.p15),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppRadius.r6),
            gapPadding: AppPadding.p10),
        disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppRadius.r6),
            gapPadding: AppPadding.p10,
            borderSide: const BorderSide(
              color: ColorsManager.lightBlack,
            )),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppRadius.r6),
            gapPadding: AppPadding.p10,
            borderSide: const BorderSide(
              color: ColorsManager.error,
            )),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppRadius.r6),
            gapPadding: AppPadding.p20,
            borderSide: const BorderSide(
              color: ColorsManager.primary,
            )),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppRadius.r6),
            gapPadding: AppPadding.p10,
            borderSide: const BorderSide(
              color: ColorsManager.error,
            )),
        hintStyle: TextStyles.hintTextStyle,
        suffixIconColor: ColorsManager.primary,
        prefixIconColor: ColorsManager.primary,
      ),
      textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
        textStyle: WidgetStatePropertyAll<TextStyle>(
          TextStyles.font12Regular,
        ),
      )));
}
