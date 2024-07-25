import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mentorship_b1/core/constants/app_assets.dart';
import 'package:flutter_mentorship_b1/core/helpers/functions.dart';
import 'package:flutter_mentorship_b1/features/launches/data/models/launches_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/themes/colors_manager.dart';
import '../../../../core/themes/styles.dart';
import '../../../../core/widgets/app_button_widgets.dart';

class LaunchItemWidget extends StatelessWidget {
  final Launch launch;

  const LaunchItemWidget({super.key, required this.launch});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: 10.h,
      ),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: ColorsManager.lightBlack,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 4,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Hero(
            tag: launch.id!,
            child: Container(
              height: 200.h,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: CachedNetworkImage(
                imageUrl: launch.links!.patch!.small ?? AppImages.spaceXLogo,
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            launch.name ?? '',
            style: TextStyles.font20Bold,
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            launch.success! ? 'Succes' : 'Failed',
            style: TextStyles.font16Regular.copyWith(
                color: launch.success! ? Colors.green : Colors.redAccent),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            launch.details ?? '',
            style: TextStyles.font12Regular,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(
            height: 20.h,
          ),
          AppButtonWidget(
            title: AppStrings.viewInWikipedia,
            onPressed: () {
              launchUrlFunction(launch.links!.wikipedia!);
            },
          ),
        ],
      ),
    );
  }
}
