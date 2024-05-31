import 'package:flutter/material.dart';
import 'package:flutter_mentorship_b1/core/helpers/extensions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/themes/colors_manager.dart';
import '../../../../core/themes/styles.dart';
import '../../../../core/widgets/app_button_widgets.dart';
import '../../data/models/dragon_model.dart';

class DragonItemWidget extends StatelessWidget {
  final Dragon dragon;
  const DragonItemWidget({super.key, required this.dragon});

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
            tag: dragon.id!,
            child: Container(
              height: 200.h,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage(dragon.flickrImages![0]),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            dragon.name!,
            style: TextStyles.font20Bold,
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            dragon.type!,
            style: TextStyles.font16Regular,
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            dragon.description!,
            style: TextStyles.font12Regular,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(
            height: 20.h,
          ),
          AppButtonWidget(
            title: AppStrings.viewDetails,
            onPressed: () {
              context.pushNamed(
                Routes.dragonsDetails,
                arguments: dragon,
              );
            },
          ),
        ],
      ),
    );
  }
}
