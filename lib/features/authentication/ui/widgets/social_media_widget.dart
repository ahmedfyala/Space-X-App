import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mentorship_b1/core/constants/app_strings.dart';
import 'package:flutter_mentorship_b1/core/helpers/extensions.dart';
import 'package:flutter_mentorship_b1/core/themes/size_manager.dart';
import 'package:flutter_mentorship_b1/core/themes/styles.dart';
import 'package:flutter_mentorship_b1/core/widgets/app_button_widgets.dart';
import 'package:flutter_mentorship_b1/features/authentication/logic/login/login_cubit.dart';
import 'package:gap/gap.dart';

import '../../../../core/routing/routes.dart';

class SocialMediaWidget extends StatelessWidget {
  const SocialMediaWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        switch (state) {
          case LoginInitial():
          case LoginLoading():
          case LoginFailure():
          case LoginSuccess():

        }
      },
      child: Row(
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
              onPressed: () {
                context.read<LoginCubit>().signInWithGoogleAccount();
              },
              height: AppHeight.h40,
              width: 0,
              title: AppStrings.google,
              textStyle: TextStyles.font16Bold,
            ),
          ),
        ],
      ),
    );
  }
}
