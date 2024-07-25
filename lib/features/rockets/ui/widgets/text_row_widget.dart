import 'package:flutter/material.dart';

import '../../../../core/themes/styles.dart';

class TextRowWidget extends StatelessWidget {
  final String title;

  final String subtitle;

  const TextRowWidget({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: '$title: ',
        style: TextStyles.font16Regular,
        children: [
          TextSpan(
            text: subtitle,
            style: TextStyles.font16Light,
          ),
        ],
      ),
    );
  }
}
