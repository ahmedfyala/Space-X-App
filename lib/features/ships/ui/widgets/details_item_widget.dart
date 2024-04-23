import 'package:flutter/material.dart';
import 'package:flutter_mentorship_b1/core/themes/colors_manager.dart';
import 'package:flutter_mentorship_b1/core/themes/size_manager.dart';
import 'package:flutter_mentorship_b1/core/themes/styles.dart';

class DetailsItemWidget extends StatelessWidget {
  final String title;
  final Widget? widget;

  const DetailsItemWidget({
    super.key,
    required this.title,
    this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyles.font20RegularPrimary,
        ),
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.all(AppPadding.p10),
          width: double.infinity,
          height: AppHeight.h40,
          decoration: BoxDecoration(
              color: ColorsManager.lightBlack,
              borderRadius: BorderRadius.circular(AppRadius.r10)),
          child: widget ?? Text(
                'No content',
                style: TextStyles.font16Bold,
              )
        ),
      ],
    );
  }
}
