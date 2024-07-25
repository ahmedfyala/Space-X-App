import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mentorship_b1/core/constants/app_strings.dart';
import 'package:flutter_mentorship_b1/core/helpers/extensions.dart';
import 'package:flutter_mentorship_b1/core/themes/size_manager.dart';
import 'package:flutter_mentorship_b1/core/themes/styles.dart';
import 'package:flutter_mentorship_b1/core/widgets/app_button_widgets.dart';
import 'package:flutter_mentorship_b1/core/widgets/error_snack_bar_widget.dart';
import 'package:flutter_mentorship_b1/features/authentication/logic/auth/auth_cubit.dart';
import 'package:gap/gap.dart';

import '../../../../core/routing/routes.dart';

class SocialMediaWidget extends StatelessWidget {
  const SocialMediaWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is GoogleSignInFailure) {
            errorSnackBar(state.error, context);
          } else if (state is GoogleSignInSuccess) {
            context.pushNamedAndRemoveUntil(
              Routes.homeScreen,
              predicate: (_) => false,
            );
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
            BlocBuilder<AuthCubit, AuthState>(
              builder: (context, state) {
                return Expanded(
                  child: AppButtonWidget(
                    onPressed: () {
                      if (state is! GoogleSignInLoading) {
                        context.read<AuthCubit>().signInWithGoogleAccount();
                      }
                    },
                    height: AppHeight.h40,
                    width: 0,
                    title: AppStrings.google,
                    textStyle: TextStyles.font16Bold,
                    isLoading: state is GoogleSignInLoading,
                  ),
                );
              },
            ),
          ],
        ));
  }
}
