import 'package:flutter/material.dart';

import '../../../../core/constants/app_assets.dart';
import '../../data/models/about_company_model.dart';
import 'team_member_widget.dart';

class TeamRowWidget extends StatelessWidget {
  final AboutCompany company;
  const TeamRowWidget({super.key, required this.company});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TeamMemberWidget(
          name: company.founder!,
          image: AppImages.founderImage,
          role: 'Founder/CEO/CTO',
        ),
        TeamMemberWidget(
          name: company.coo!,
          image: AppImages.cooImage,
          role: 'COO',
        ),
      ],
    );
  }
}
