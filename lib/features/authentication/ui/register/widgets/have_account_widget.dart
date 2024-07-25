import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constants/app_strings.dart';
import '../../../../../core/themes/styles.dart';

class HaveAccountWidget extends StatelessWidget {
  const HaveAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: AppStrings.alreadyHaveAnAccount,
        style: TextStyles.font12Regular,
        children: [
          TextSpan(
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                //context.pushNamed(Routes.login);
                Navigator.pop(context);
              },
            text: AppStrings.loginNow,
            style: TextStyles.font16BoldPrimary,
          ),
        ],
      ),
    );
  }
}
