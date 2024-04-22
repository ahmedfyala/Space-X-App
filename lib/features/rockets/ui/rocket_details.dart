import 'package:flutter/material.dart';
import 'package:flutter_mentorship_b1/core/themes/styles.dart';
import 'package:flutter_mentorship_b1/features/rockets/data/modes/rocket_model.dart';
import 'package:flutter_mentorship_b1/features/rockets/ui/widgets/more_images_list_widget.dart';
import 'package:flutter_mentorship_b1/features/rockets/ui/widgets/rocket_details_engine.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/app_strings.dart';
import '../../../core/helpers/spaces.dart';
import 'widgets/rocket_details_box_widget.dart';

class RocketDetails extends StatelessWidget {
  final RocketModel rocket;

  const RocketDetails({super.key, required this.rocket});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          rocket.name!,
          style: TextStyles.font20Bold,
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: rocket.name!,
              child: Center(
                child: Container(
                  height: 250.h,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                  child: Image.network(
                    rocket.flickrImages![0],
                  ),
                ),
              ),
            ),
            verticalSpace(10.h),
            Text(
              AppStrings.rocketDetails,
              style: TextStyles.font20RegularPrimary,
            ),
            RocketDetailsBoxWidget(text: rocket.description!),
            verticalSpace(10.h),
            Text(
              AppStrings.rocketStatus,
              style: TextStyles.font20RegularPrimary,
            ),
            RocketDetailsBoxWidget(
              text: rocket.active != null && rocket.active!
                  ? AppStrings.active
                  : AppStrings.notActive,
            ),
            verticalSpace(10.h),
            Text(
              AppStrings.rocketCountry,
              style: TextStyles.font20RegularPrimary,
            ),
            RocketDetailsBoxWidget(
              text: rocket.country != null
                  ? rocket.country!
                  : AppStrings.notAvailable,
            ),
            verticalSpace(10.h),
            Text(
              AppStrings.rocketStages,
              style: TextStyles.font20RegularPrimary,
            ),
            RocketDetailsBoxWidget(
              text: rocket.stages != null
                  ? rocket.stages!.toString()
                  : AppStrings.notAvailable,
            ),
            verticalSpace(10.h),
            Text(
              AppStrings.costPerLaunch,
              style: TextStyles.font20RegularPrimary,
            ),
            RocketDetailsBoxWidget(
              text: rocket.costPerLaunch.toString(),
            ),
            if (rocket.engines != null)
              RocketDetailsEngineWidget(
                engines: rocket.engines,
              ),
            verticalSpace(10.h),
            Text(
              AppStrings.moreImages,
              style: TextStyles.font20RegularPrimary,
            ),
            MoreImagesListWidget(
              flickrImages: rocket.flickrImages!,
            ),
          ],
        ),
      ),
    );
  }
}
