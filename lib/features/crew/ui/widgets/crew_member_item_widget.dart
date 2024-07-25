import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mentorship_b1/core/constants/app_strings.dart';
import 'package:flutter_mentorship_b1/core/widgets/error_snack_bar_widget.dart';
import 'package:flutter_mentorship_b1/features/crew/data/models/crew_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/helpers/spaces.dart';
import '../../../../core/themes/colors_manager.dart';
import '../../../../core/themes/styles.dart';

class CrewMemberItemWidget extends StatelessWidget {
  final CrewMember crewMember;

  const CrewMemberItemWidget({super.key, required this.crewMember});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: ColorsManager.lightBlack,
          borderRadius: BorderRadius.circular(6),
        ),
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 160.h,
              width: double.infinity,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
              ),
              child: CachedNetworkImage(
                imageUrl: crewMember.image!,
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            verticalSpace(5.h),
            Text(
              crewMember.name!,
              style: TextStyles.font16Bold,
            ),
            verticalSpace(5.h),
            Text(
              crewMember.agency!,
              style: TextStyles.font12Regular,
            ),
            const Spacer(),
            TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  backgroundColor: ColorsManager.primary,
                ),
                onPressed: () async {
                  final Uri url = Uri.parse(crewMember.wikipedia!);

                  if (!await launchUrl(url)) {
                    errorSnackBar('Could not launch $url', context);
                  }
                },
                child: Text(AppStrings.viewInWikipedia,
                    style: TextStyles.font16Bold)),
          ],
        ));
  }
}
