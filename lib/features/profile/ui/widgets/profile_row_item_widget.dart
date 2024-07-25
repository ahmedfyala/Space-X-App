import 'package:flutter/material.dart';
import 'package:flutter_mentorship_b1/core/helpers/extensions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spaces.dart';
import '../../../../core/themes/styles.dart';

class ProfileRowItemWidget extends StatelessWidget {
  final String title;
  final String routeName;
  final IconData icon;
  final Function()? onTap;
  const ProfileRowItemWidget({
    super.key,
    required this.routeName,
    required this.title,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap ??
              () {
                 context.pushNamed(routeName);
              },
          child: Row(
            children: [
              Icon(
                icon,
              ),
              horizontalSpace(10.h),
              Text(
                title,
                style: TextStyles.font16Regular,
              ),
              const Spacer(),
              const Icon(Icons.redo_rounded),
            ],
          ),
        ),
        verticalSpace(10.h),
      ],
    );
  }
}
