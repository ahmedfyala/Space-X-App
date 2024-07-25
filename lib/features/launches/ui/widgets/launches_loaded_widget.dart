import 'package:flutter/material.dart';
import 'package:flutter_mentorship_b1/features/launches/data/models/launches_model.dart';

import 'launch_item_widget.dart';

class LaunchesLoadedWidget extends StatelessWidget {
  final List<Launch>  launches;
  const LaunchesLoadedWidget({super.key, required this.launches});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: launches.length,
      itemBuilder: (context, index) {
        return LaunchItemWidget(launch: launches[index]);
      },
    );
  }
}
