import 'package:flutter/material.dart';
import 'package:flutter_mentorship_b1/core/constants/app_strings.dart';

import '../../../../core/themes/styles.dart';

class TitleRowWidget extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const TitleRowWidget({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyles.font16Bold,
        ),
        InkWell(
          onTap: onTap,
          child: Text(
            AppStrings.seeAll,
            style: TextStyles.font12Light,
          ),
        ),
      ],
    );
  }
}
