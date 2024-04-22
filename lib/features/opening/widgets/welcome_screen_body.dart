import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mentorship_b1/core/constants/app_strings.dart';
import 'package:flutter_mentorship_b1/core/helpers/extensions.dart';
import 'package:flutter_mentorship_b1/core/routing/routes.dart';
import 'package:flutter_mentorship_b1/core/themes/size_manager.dart';
import 'package:flutter_mentorship_b1/core/widgets/app_button_widgets.dart';
import 'package:flutter_mentorship_b1/features/opening/widgets/welcome_text_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../core/themes/styles.dart';

class WelcomeScreenBody extends StatelessWidget {
  const WelcomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(AppPadding.p20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gap(AppSize.s30),
          WelcomeTextWidget(
            title: AppStrings.welcomeText1,
            textStyle: TextStyles.font24Bold,
          ),
          WelcomeTextWidget(
            title: AppStrings.welcomeText2,
            textStyle: TextStyles.font16light,
          ),
          Gap(AppSize.s50),
          Image.asset(
            'assets/png/control-panel.png',
            fit: BoxFit.cover,
          ),
          const Spacer(),
          AppButtonWidget(
            height: AppHeight.h40,
            width: double.infinity,
            title: AppStrings.launch,
            textStyle: TextStyles.font16Bold,
            onPressed: (){
              context.pushReplacementNamed(Routes.login);
            },
          ),
          Gap(AppSize.s30)
        ],
      ),
    );
  }
}
