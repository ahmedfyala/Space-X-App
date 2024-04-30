import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mentorship_b1/core/helpers/app_regexp.dart';
import 'package:flutter_mentorship_b1/core/helpers/extensions.dart';
import 'package:flutter_mentorship_b1/core/widgets/app_button_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/app_strings.dart';
import '../../../../../core/helpers/spaces.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/themes/colors_manager.dart';
import '../../../../../core/themes/styles.dart';
import '../../../../../core/widgets/app_text_form_field_widget.dart';
import '../../../../../core/widgets/error_snack_bar_widget.dart';
import '../../../logic/register/register_cubit.dart';

class RegisterFormWidget extends StatefulWidget {
  const RegisterFormWidget({super.key});

  @override
  State<RegisterFormWidget> createState() => _RegisterFormWidgetState();
}

class _RegisterFormWidgetState extends State<RegisterFormWidget> {
  @override
  Widget build(BuildContext context) {
    var cubit = context.read<RegisterCubit>();
    return BlocListener<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSuccess) {
          context.pushNamed(Routes.homeScreen);
        } else if (state is RegisterFailure) {
          errorSnackBar(state.error, context);
        }
      },
      child: Form(
        key: cubit.formKey,
        child: Column(
          children: [
            AppTextFormFieldWidget(
              controller: cubit.nameController,
              hintText: AppStrings.username,
              textInputType: TextInputType.name,
              icon: Icons.person_2_rounded,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your username';
                } else if (!AppRegExp.isNameValid(cubit.nameController.text)) {
                  return 'Please enter Correct username';
                }
                return null;
              },
            ),
            verticalSpace(10.h),
            AppTextFormFieldWidget(
              controller: cubit.emailController,
              hintText: AppStrings.email,
              textInputType: TextInputType.emailAddress,
              icon: Icons.email_rounded,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                } else if (!AppRegExp.isEmailValid(
                    cubit.emailController.text)) {
                  return 'Please enter Correct email';
                }
                return null;
              },
            ),
            verticalSpace(10.h),
            AppTextFormFieldWidget(
              controller: cubit.passwordController,
              hintText: AppStrings.password,
              textInputType: TextInputType.visiblePassword,
              icon: Icons.lock_rounded,
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                } else if (!AppRegExp.isPasswordValid(
                    cubit.passwordController.text)) {
                  return 'Please enter Correct password';
                }
                return null;
              },
            ),
            verticalSpace(10.h),
            AppTextFormFieldWidget(
              controller: cubit.confirmPasswordController,
              hintText: AppStrings.repeatPassword,
              textInputType: TextInputType.visiblePassword,
              icon: Icons.lock_rounded,
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter confirm password';
                } else if (cubit.confirmPasswordController.text !=
                    cubit.passwordController.text) {
                  return 'Confirm password not match';
                }
                return null;
              },
            ),
            verticalSpace(10.h),
            BlocBuilder<RegisterCubit, RegisterState>(
              builder: (context, state) {
                return Row(
                  children: [
                    CupertinoCheckbox(
                      value: cubit.rememberMe,
                      onChanged: (value) {
                        cubit.changeRememberMe();
                      },
                      checkColor: ColorsManager.primary,
                      activeColor: ColorsManager.black,
                      inactiveColor: ColorsManager.black,
                      side: BorderSide(
                          color: ColorsManager.primary.withOpacity(0.6),
                          width: 1),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(4),
                        ),
                      ),
                    ),
                    Text(
                      AppStrings.rememberMe,
                      style: TextStyles.font12Regular,
                    ),
                  ],
                );
              },
            ),
            verticalSpace(20.h),
            AppButtonWidget(
              title: AppStrings.signUp,
              onPressed: () {
                cubit.register();
              },
            ),
            verticalSpace(20.h),
          ],
        ),
      ),
    );
  }
}
