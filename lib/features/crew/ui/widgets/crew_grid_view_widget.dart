import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/models/crew_model.dart';
import 'crew_member_item_widget.dart';

class CrewGridViewWidget extends StatelessWidget {
  final List<CrewMember> crew;

  const CrewGridViewWidget({super.key, required this.crew});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.55,
          mainAxisSpacing: 10.h,
          crossAxisSpacing: 10.w,
        ),
        padding: const EdgeInsets.all(10),
        itemCount: crew.length,
        itemBuilder: (context, index) {
          return CrewMemberItemWidget(crewMember: crew[index]);
        });
  }
}
