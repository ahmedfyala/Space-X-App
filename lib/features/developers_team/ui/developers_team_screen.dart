import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mentorship_b1/core/themes/colors_manager.dart';
import 'package:flutter_mentorship_b1/features/developers_team/data/models/team_model.dart';
import 'package:flutter_mentorship_b1/features/developers_team/ui/widgets/developers_team_item_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/helpers/spaces.dart';
import '../../../core/themes/styles.dart';

class DevelopersTeamScreen extends StatelessWidget {
  const DevelopersTeamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'App Developers Team',
          style: TextStyles.font24Bold,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Expanded(
              child: DevelopersTeamItemWidget(
                team: team[0],
              ),
            ),
            Expanded(
              child: DevelopersTeamItemWidget(
                team: team[1],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
