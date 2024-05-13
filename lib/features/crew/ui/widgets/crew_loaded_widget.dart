import 'package:flutter/material.dart';
import 'package:flutter_mentorship_b1/core/constants/app_strings.dart';
import 'package:flutter_mentorship_b1/features/crew/data/models/crew_model.dart';

import '../../../../core/helpers/spaces.dart';
import '../../../../core/themes/colors_manager.dart';
import '../../../../core/themes/styles.dart';
import 'crew_grid_view_widget.dart';

class CrewLoadedWidget extends StatelessWidget {
  final List<CrewMember> crew;

  const CrewLoadedWidget({super.key, required this.crew});

  @override
  Widget build(BuildContext context) {
    if (crew.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.group_off_rounded,
              size: 100,
              color: ColorsManager.primary,
            ),
            verticalSpace(10),
            Text(
              AppStrings.noCrewMembersFound,
              style:
                  TextStyles.font20Bold.copyWith(color: ColorsManager.primary),
            ),
          ],
        ),
      );
    }
    return CrewGridViewWidget(crew: crew);
  }
}
