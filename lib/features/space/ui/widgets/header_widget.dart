import 'package:flutter/material.dart';
import 'package:flutter_mentorship_b1/core/constants/app_assets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/themes/styles.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        Image.asset(
          AppImages.homeImage,
          height: MediaQuery.of(context).size.height * 0.3,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Padding(
          padding: EdgeInsets.only(
            top: 40.h,
            left: 20.w,
          ),
          child: Text(
            "Discover",
            style: TextStyles.font24Bold,
          ),
        ),
      ],
    );
  }
}
