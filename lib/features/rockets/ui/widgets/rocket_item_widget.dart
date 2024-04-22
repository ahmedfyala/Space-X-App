import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/themes/colors_manager.dart';
import '../../../../core/themes/styles.dart';
import '../../data/modes/rocket_model.dart';
import '../rocket_details.dart';

class RocketItemWidget extends StatelessWidget {
  final RocketModel rocket;

  const RocketItemWidget({super.key, required this.rocket});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RocketDetails(rocket: rocket),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: ColorsManager.lightBlack,
          borderRadius: BorderRadius.circular(6.r),
        ),
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            Hero(
              tag: rocket.name!,
              child: Container(
                height: 64.h,
                width: 80.w,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.r),
                ),
                child: Image.network(
                  rocket.flickrImages![0],
                ),
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            Text(
              rocket.name!,
              style: TextStyles.font16Bold,
            ),
            const Spacer(),
            Icon(
              Icons.arrow_forward_ios_rounded,
              size: 20.sp,
              color: ColorsManager.primary,
            ),
          ],
        ),
      ),
    );
  }
}
