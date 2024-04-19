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
  static TextStyle font16Bold = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.bold,
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
}
