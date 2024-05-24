import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/helpers/spaces.dart';
import '../../../../core/themes/colors_manager.dart';
import '../../../../core/themes/styles.dart';
import '../../data/models/about_company_model.dart';
import 'details_list_widget.dart';
import 'social_links_widget.dart';
import 'team_row_widget.dart';

class CompanyLoadedWidget extends StatelessWidget {
  final AboutCompany company;
  const CompanyLoadedWidget({super.key, required this.company});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: 150.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            clipBehavior: Clip.antiAlias,
            child: Image.network(
              width: double.infinity,
              AppImages.spaceXLogo,
              fit: BoxFit.fitWidth,
            ),
          ),
          verticalSpace(10.h),
          Text(
            company.summary ?? '',
            style: TextStyles.font16Regular,
          ),
          verticalSpace(10.h),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Founded: ',
                  style: TextStyles.font20Bold.copyWith(
                    color: ColorsManager.primary,
                  ),
                ),
                TextSpan(
                  text: company.founded.toString(),
                  style: TextStyles.font16Regular,
                ),
              ],
            ),
          ),
          verticalSpace(10.h),
          Text(
            AppStrings.team,
            style: TextStyles.font20Bold.copyWith(
              color: ColorsManager.primary,
            ),
          ),
          verticalSpace(10.h),
          TeamRowWidget(company: company),
          verticalSpace(10.h),
          DetailsListWidget(company: company),
          verticalSpace(10.h),
          SocialLinksWidget(links: company.links!),
          verticalSpace(10.h),
        ],
      ),
    );
  }
}
