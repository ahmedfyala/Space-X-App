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
}
