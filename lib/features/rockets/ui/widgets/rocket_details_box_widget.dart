import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/themes/colors_manager.dart';
import '../../../../core/themes/styles.dart';

class RocketDetailsBoxWidget extends StatelessWidget {
  final String text;
  final Widget? widget;
  const RocketDetailsBoxWidget({super.key, required this.text, this.widget});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorsManager.lightBlack,
        borderRadius: BorderRadius.circular(6.r),
      ),
      margin: EdgeInsets.symmetric(vertical: 10.h),
      padding: const EdgeInsets.all(10),
      child: widget ?? Text(text, style: TextStyles.font18Regular),
    );
  }
}
