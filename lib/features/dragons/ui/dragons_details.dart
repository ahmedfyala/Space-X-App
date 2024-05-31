import 'package:flutter/material.dart';
import 'package:flutter_mentorship_b1/core/constants/app_strings.dart';
import 'package:flutter_mentorship_b1/core/helpers/functions.dart';
import 'package:flutter_mentorship_b1/features/dragons/ui/widgets/dragon_details_images_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/themes/colors_manager.dart';
import '../../../core/themes/styles.dart';
import '../data/models/dragon_model.dart';
import 'widgets/dragons_details_box_widget.dart';

class DragonsDetails extends StatelessWidget {
  final Dragon dragon;

  const DragonsDetails({super.key, required this.dragon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          dragon.name!,
          style: TextStyles.font24Bold,
        ),
        actions: [
          IconButton(
            onPressed: () {
              launchUrlFunction(dragon.wikipedia!);
            },
            icon: const Icon(
              Icons.link_rounded,
              color: ColorsManager.primary,
              size: 24,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DragonDetailsImagesWidget(
                id: dragon.id!,
                flickrImages: dragon.flickrImages!,
              ),
              SizedBox(height: 20.h),
              Text(AppStrings.description,
                  style: TextStyles.font20RegularPrimary),
              SizedBox(height: 5.h),
              DragonsDetailsBoxWidget(text: dragon.description!),
              SizedBox(height: 20.h),
              Text(AppStrings.status, style: TextStyles.font20RegularPrimary),
              DragonsDetailsBoxWidget(
                text: dragon.active != null && dragon.active!
                    ? AppStrings.active
                    : AppStrings.notActive,
              ),
              SizedBox(height: 10.h),
              Text(AppStrings.type, style: TextStyles.font20RegularPrimary),
              SizedBox(height: 5.h),
              DragonsDetailsBoxWidget(text: dragon.type!),
              SizedBox(height: 10.h),
              Text(AppStrings.firstFlight,
                  style: TextStyles.font20RegularPrimary),
              SizedBox(height: 5.h),
              DragonsDetailsBoxWidget(text: dragon.firstFlight!),
              SizedBox(height: 10.h),
              Text(AppStrings.dryMass, style: TextStyles.font20RegularPrimary),
              SizedBox(height: 5.h),
              DragonsDetailsBoxWidget(
                  text: "${dragon.dryMassKg}  ${AppStrings.kg}"),
            ],
          ),
        ),
      ),
    );
  }
}
