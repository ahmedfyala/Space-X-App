import 'package:flutter/material.dart';
import 'package:flutter_mentorship_b1/features/space/models/category_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/themes/colors_manager.dart';
import '../../../../core/themes/styles.dart';

class CategoriesItemWidget extends StatelessWidget {
  final CategoryModel categoryModel;
  final VoidCallback onTap;
  const CategoriesItemWidget({
    super.key,
    required this.categoryModel,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 72.h,
        width: 72.w,
        decoration: BoxDecoration(
          color: ColorsManager.lightBlack,
          borderRadius: BorderRadius.circular(6.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              categoryModel.icon,
              color: ColorsManager.white,
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              categoryModel.text,
              style: TextStyles.font12Regular,
            ),
          ],
        ),
      ),
    );
  }
}
