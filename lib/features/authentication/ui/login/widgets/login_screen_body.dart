import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mentorship_b1/core/themes/size_manager.dart';
import 'package:flutter_mentorship_b1/core/themes/styles.dart';
import 'package:flutter_mentorship_b1/features/authentication/ui/login/widgets/login_text_widget.dart';
import 'package:gap/gap.dart';

import '../../widgets/divider_widget.dart';
import '../../widgets/social_media_widget.dart';
import 'login_form_widget.dart';
import 'not_an_account.dart';

class LoginScreenBody extends StatelessWidget {
  const LoginScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Gap(AppHeight.h40),
          Image.asset(
            'assets/png/control-panel.png',
            fit: BoxFit.cover,
            width: AppWidth.w150,
          ),
          Gap(AppHeight.h20),
          LoginTextWidget(
            text: 'Space Explorer',
            textStyle: TextStyles.font24Bold,
          ),
          const LoginFormWidget(),
          Gap(AppHeight.h20),
          const DividerWidget(),
          Gap(AppHeight.h20),
          const SocialMediaWidget(),
          Gap(AppHeight.h20),
          const NotAnAccount(),
        ],
      ),
    );
  }
}
