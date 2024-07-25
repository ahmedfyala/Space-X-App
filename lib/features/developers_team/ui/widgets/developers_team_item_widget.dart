import 'package:flutter/material.dart';
import 'package:flutter_mentorship_b1/core/helpers/functions.dart';
import 'package:flutter_mentorship_b1/features/developers_team/data/models/team_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spaces.dart';
import '../../../../core/themes/colors_manager.dart';
import '../../../../core/themes/styles.dart';

class DevelopersTeamItemWidget extends StatelessWidget {
  final TeamModel team;
  const DevelopersTeamItemWidget({super.key, required this.team});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 150.h,
          width: 150.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          clipBehavior: Clip.antiAlias,
          child: Image.network(
            team.image,
            fit: BoxFit.cover,
          ),
        ),
        verticalSpace(10.h),
        Text(
          team.name,
          style: TextStyles.font20Bold,
        ),
        verticalSpace(10.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                launchUrlFunction(team.github);
              },
              child: Image.network(
                'https://cdn-icons-png.flaticon.com/512/25/25231.png',
                color: ColorsManager.white,
                height: 30.h,
                width: 30.w,
              ),
            ),
            horizontalSpace(10.w),
            InkWell(
              onTap: () {
                launchUrlFunction(team.linkedin);
              },
              child: Image.network(
                'https://olc-wordpress-assets.s3.amazonaws.com/uploads/2020/05/linkedin-icon.png',
                height: 30.h,
                width: 30.w,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
