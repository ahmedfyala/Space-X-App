import 'package:flutter/material.dart';
import 'package:flutter_mentorship_b1/core/constants/app_strings.dart';
import 'package:flutter_mentorship_b1/core/themes/colors_manager.dart';
import 'package:flutter_mentorship_b1/core/themes/size_manager.dart';
import 'package:flutter_mentorship_b1/core/themes/styles.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
            child: Divider(
          color: ColorsManager.lightBlack,
        )),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppPadding.p10),
          child: Text(
            AppStrings.or,
            style: TextStyles.font16Bold,
          ),
        ),
        const Expanded(
            child: Divider(
          color: ColorsManager.lightBlack,
        )),
      ],
    );
  }
}
