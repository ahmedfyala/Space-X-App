import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/modes/rocket_model.dart';

class RocketDetailsImageWidget extends StatelessWidget {
  final RocketModel rocket;
  const RocketDetailsImageWidget({super.key, required this.rocket});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: rocket.name!,
      child: Center(
        child: Container(
          height: 250.h,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.r),
          ),
          child: Image.network(
            rocket.flickrImages![0],
          ),
        ),
      ),
    );
  }
}
