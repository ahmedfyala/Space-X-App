import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/themes/colors_manager.dart';
import '../../../../core/themes/styles.dart';

class DetailsCardWidget extends StatelessWidget {
  final String title;
  final String data;
  const DetailsCardWidget({super.key, required this.title, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5.h),
      decoration: BoxDecoration(
        color: ColorsManager.lightBlack,
        borderRadius: BorderRadius.circular(6),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyles.font16Bold.copyWith(
              color: ColorsManager.primary,
            ),
          ),
          Text(
            data,
            style: TextStyles.font14Regular,
          ),
        ],
      ),
    );
  }
}
