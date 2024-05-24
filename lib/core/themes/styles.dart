import 'package:flutter_mentorship_b1/core/themes/colors_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'font_weight_helper.dart';
import 'package:flutter/material.dart';

class TextStyles {
  static const String fontFamily = 'Roboto';

  static TextStyle font24Bold = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeightHelper.bold,
    color: ColorsManager.white,
    fontFamily: fontFamily,
  );
  static TextStyle font16light = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.light,
    color: ColorsManager.white,
    fontFamily: fontFamily,
  );
  static TextStyle font16Bold = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.bold,
    color: ColorsManager.white,
    fontFamily: fontFamily,
  );
  static TextStyle font16BoldPrimary = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.bold,
    color: ColorsManager.primary,
    fontFamily: fontFamily,
  );
  static TextStyle font16BoldError = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.bold,
    color: ColorsManager.error,
    fontFamily: fontFamily,
  );
  static TextStyle hintTextStyle = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.bold,
    color: ColorsManager.darkWhite,
    fontFamily: fontFamily,
  );
  static TextStyle font20Bold = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeightHelper.bold,
    color: ColorsManager.white,
    fontFamily: fontFamily,
  );
  static TextStyle font20RegularPrimary = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeightHelper.regular,
    color: ColorsManager.primary,
    fontFamily: fontFamily,
  );
  static TextStyle font16Regular = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.regular,
    color: ColorsManager.white,
    fontFamily: fontFamily,
  );
  static TextStyle font16Light = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.light,
    color: ColorsManager.white,
    fontFamily: fontFamily,
  );
  static TextStyle font12Light = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeightHelper.light,
    color: ColorsManager.white,
    fontFamily: fontFamily,
  );
  static TextStyle font12Regular = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeightHelper.regular,
    color: ColorsManager.white,
    fontFamily: fontFamily,
  );
  static TextStyle font18Regular = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeightHelper.regular,
    color: ColorsManager.white,
    fontFamily: fontFamily,
  );
  static TextStyle font18Bold = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeightHelper.bold,
    color: ColorsManager.white,
    fontFamily: fontFamily,
  );

  static TextStyle font18Light = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeightHelper.light,
    color: ColorsManager.white,
    fontFamily: fontFamily,
  );

  static TextStyle font14Regular = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.regular,
    color: ColorsManager.white,
    fontFamily: fontFamily,
  );
}
