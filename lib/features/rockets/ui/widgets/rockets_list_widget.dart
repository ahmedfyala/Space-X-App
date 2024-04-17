import 'package:flutter/material.dart';
import 'package:flutter_mentorship_b1/features/rockets/ui/widgets/rocket_item_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/modes/rocket_model.dart';

class RocketsListWidget extends StatelessWidget {
  final List<RocketModel> rockets;
  const RocketsListWidget({super.key, required this.rockets});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) =>
            RocketItemWidget(rocket: rockets[index]),
        separatorBuilder: (context, index) => SizedBox(
              height: 20.h,
            ),
        itemCount: rockets.length);
  }
}
