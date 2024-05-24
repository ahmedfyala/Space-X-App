import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spaces.dart';
import '../../../../core/themes/styles.dart';

class TeamMemberWidget extends StatelessWidget {
  final String name;
  final String image;
  final String role;
  const TeamMemberWidget(
      {super.key, required this.name, required this.image, required this.role});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Text(
            role,
            style: TextStyles.font18Bold,
          ),
          verticalSpace(5.h),
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            clipBehavior: Clip.antiAlias,
            child: Image.network(
              image,
              fit: BoxFit.cover,
            ),
          ),
          verticalSpace(5.h),
          Text(
            name,
            style: TextStyles.font16Regular,
          ),
        ],
      ),
    );
  }
}
