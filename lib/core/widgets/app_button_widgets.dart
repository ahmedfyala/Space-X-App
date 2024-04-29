import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../themes/styles.dart';

class AppButtonWidget extends StatelessWidget {
  final double height;
  final double width;
  final String title;
  final void Function()? onPressed;
  final TextStyle? textStyle;

  const AppButtonWidget({
    super.key,
    this.height = 40,
    this.width = double.infinity,
    required this.title,
    this.onPressed,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height.h,
      width: width.w,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          title,
          style: textStyle ?? TextStyles.font16Bold,
        ),
      ),
    );
  }
}
