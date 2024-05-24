import 'package:flutter/material.dart';
import 'package:flutter_mentorship_b1/features/about_company/data/models/about_company_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spaces.dart';
import 'details_card_widget.dart';

class DetailsListWidget extends StatelessWidget {
  final AboutCompany company;
  const DetailsListWidget({super.key, required this.company});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        children: [
          DetailsCardWidget(
            title: 'Employees Number:',
            data: company.employees!.toString(),
          ),
          horizontalSpace(10.w),
          DetailsCardWidget(
            title: 'Launch Sites',
            data: company.launchSites!.toString(),
          ),
          horizontalSpace(10.w),
          DetailsCardWidget(
            title: 'Test Sites',
            data: company.testSites!.toString(),
          ),
          horizontalSpace(10.w),
          DetailsCardWidget(
            title: 'Valuation',
            data: company.valuation!.toString(),
          ),
          horizontalSpace(10.w),
          DetailsCardWidget(
            title: 'Vehicles',
            data: company.vehicles!.toString(),
          ),
        ],
      ),
    );
  }
}
