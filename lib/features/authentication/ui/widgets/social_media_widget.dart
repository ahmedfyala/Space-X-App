import 'package:flutter/material.dart';
import 'package:flutter_mentorship_b1/core/constants/app_strings.dart';
import 'package:flutter_mentorship_b1/core/themes/size_manager.dart';
import 'package:flutter_mentorship_b1/core/themes/styles.dart';
import 'package:flutter_mentorship_b1/core/widgets/app_button_widgets.dart';
import 'package:gap/gap.dart';

class SocialMediaWidget extends StatelessWidget {
  const SocialMediaWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: AppButtonWidget(
            height: AppHeight.h40,
            width: 0,
            title: AppStrings.facebook,
            textStyle: TextStyles.font16Bold,
          ),
        ),
        Gap(AppWidth.w15),
        Expanded(
          child: AppButtonWidget(
            height: AppHeight.h40,
            width: 0,
            title: AppStrings.google,
            textStyle: TextStyles.font16Bold,
          ),
        ),
      ],
    );
  }
}
