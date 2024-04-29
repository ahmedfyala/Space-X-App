import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mentorship_b1/core/constants/app_strings.dart';
import 'package:flutter_mentorship_b1/core/helpers/extensions.dart';
import 'package:flutter_mentorship_b1/core/routing/routes.dart';
import 'package:flutter_mentorship_b1/core/themes/size_manager.dart';
import 'package:flutter_mentorship_b1/core/themes/styles.dart';
import 'package:flutter_mentorship_b1/core/widgets/app_button_widgets.dart';
import 'package:flutter_mentorship_b1/core/widgets/app_text_form_field_widget.dart';
import 'package:flutter_mentorship_b1/features/authentication/ui/login/widgets/login_text_widget.dart';
import 'package:gap/gap.dart';

import '../../widgets/divider_widget.dart';
import 'forgot_password_widget.dart';
import '../../widgets/social_media_widget.dart';
import 'not_an_account.dart';

class LoginScreenBody extends StatelessWidget {
  LoginScreenBody({super.key});

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

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
            text: 'SpaceXplorer',
            textStyle: TextStyles.font24Bold,
          ),
          LoginTextWidget(
            text: AppStrings.exploreSpaceLogin,
            textStyle: TextStyles.font16light,
          ),
          Gap(AppHeight.h20),
          AppTextFormFieldWidget(
            controller: emailController,
            hintText: AppStrings.email,
            textInputType: TextInputType.emailAddress,
          ),
          Gap(AppHeight.h20),
          AppTextFormFieldWidget(
            controller: passwordController,
            hintText: AppStrings.password,
            textInputType: TextInputType.visiblePassword,
          ),
          const Align(
            alignment: AlignmentDirectional.bottomEnd,
            child: ForgotPasswordWidget(),
          ),
          Gap(AppHeight.h20),
          AppButtonWidget(
            height: AppHeight.h40,
            width: double.infinity,
            title: AppStrings.enter,
            textStyle: TextStyles.font16Bold,
            onPressed: () {
              context.pushNamed(Routes.homeScreen);
            },
          ),
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
