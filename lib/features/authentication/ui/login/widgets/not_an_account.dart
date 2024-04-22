import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mentorship_b1/core/constants/app_strings.dart';
import 'package:flutter_mentorship_b1/core/helpers/extensions.dart';
import 'package:flutter_mentorship_b1/core/routing/routes.dart';
import 'package:flutter_mentorship_b1/core/themes/styles.dart';

class NotAnAccount extends StatelessWidget {
  const NotAnAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: AppStrings.newHere,
        style: TextStyles.font12Regular,
        children: [
          TextSpan(
            recognizer: TapGestureRecognizer()..onTap = () {
              context.pushNamed(Routes.register);
            },
            text: AppStrings.joinNwo,
            style: TextStyles.font16BoldPrimary,
          ),
        ],
      ),
    );
  }
}
