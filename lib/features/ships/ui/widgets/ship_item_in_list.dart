import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/themes/colors_manager.dart';
import '../../../../core/themes/styles.dart';

class ShipItemInList extends StatelessWidget {
  final String image;
  final String name;

  const ShipItemInList({
    super.key,
    required this.image,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70.h,
      decoration: BoxDecoration(
        color: ColorsManager.lightBlack,
        borderRadius: BorderRadius.circular(6.r),
      ),
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 64.h,
            width: 80.w,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.r),
            ),
            child: Image.network(
              image,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            name,
            style: TextStyles.font16Bold,
          ),
          Icon(
            Icons.arrow_forward_ios_rounded,
            size: 20.sp,
            color: ColorsManager.white,
          )
        ],
      ),
    );
  }
}
