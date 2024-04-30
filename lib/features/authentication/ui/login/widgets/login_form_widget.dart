import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mentorship_b1/core/constants/app_strings.dart';
import 'package:flutter_mentorship_b1/core/helpers/extensions.dart';
import 'package:flutter_mentorship_b1/core/routing/routes.dart';
import 'package:flutter_mentorship_b1/core/themes/size_manager.dart';
import 'package:flutter_mentorship_b1/core/themes/styles.dart';
import 'package:flutter_mentorship_b1/core/widgets/app_button_widgets.dart';
import 'package:flutter_mentorship_b1/core/widgets/app_text_form_field_widget.dart';
import 'package:flutter_mentorship_b1/core/widgets/error_snack_bar_widget.dart';
import 'package:flutter_mentorship_b1/features/authentication/logic/login/login_cubit.dart';
import 'package:flutter_mentorship_b1/features/authentication/ui/login/widgets/login_text_widget.dart';
import 'package:gap/gap.dart';

import '../../../../../core/helpers/app_regexp.dart';
import 'forgot_password_widget.dart';

class LoginFormWidget extends StatelessWidget {
  const LoginFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          context.pushNamedAndRemoveUntil(Routes.homeScreen,
              predicate: (_) => false);
        }
        if (state is LoginFailure) {
          errorSnackBar(state.error, context);
        }
      },
      child: Form(
        key: context.read<LoginCubit>().formKey,
        child: Column(children: [
          LoginTextWidget(
            text: AppStrings.exploreSpaceLogin,
            textStyle: TextStyles.font16light,
          ),
          Gap(AppHeight.h20),
          AppTextFormFieldWidget(
            controller: context.read<LoginCubit>().emailController,
            hintText: AppStrings.email,
            textInputType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              } else if (!AppRegExp.isEmailValid(value)) {
                return 'Please enter correct email';
              }
              return null;
            },
          ),
          Gap(AppHeight.h20),
          AppTextFormFieldWidget(
            controller: context.read<LoginCubit>().passwordController,
            hintText: AppStrings.password,
            textInputType: TextInputType.visiblePassword,
            obscureText: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              } else if (!AppRegExp.isPasswordValid(value)) {
                return 'Please enter correct password';
              }
              return null;
            },
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
              context.read<LoginCubit>().login();
            },
          ),
        ]),
      ),
    );
  }
}
