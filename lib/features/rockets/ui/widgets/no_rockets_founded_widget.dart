import 'package:flutter/material.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/themes/styles.dart';

class NoRocketsFoundedWidget extends StatelessWidget {
  const NoRocketsFoundedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        AppStrings.noRocketsFound,
        style: TextStyles.font16Bold,
      ),
    );
  }
}
