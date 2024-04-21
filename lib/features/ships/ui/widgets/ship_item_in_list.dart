import 'package:flutter/material.dart';
import 'package:flutter_mentorship_b1/core/themes/size_manager.dart';

import '../../../../core/themes/colors_manager.dart';
import '../../../../core/themes/styles.dart';
import 'image_network_error.dart';

class ShipItemInList extends StatelessWidget {
  final String image;
  final String name;

  const ShipItemInList({
    super.key,
    required this.image,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: AppHeight.h70,
      decoration: BoxDecoration(
        color: ColorsManager.lightBlack,
        borderRadius: BorderRadius.circular(AppRadius.r6),
      ),
      padding: EdgeInsets.all(AppPadding.p10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: AppHeight.h64,
            width: AppWidth.h80,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppRadius.r6),
            ),
            child: Image.network(
              image,
              fit: BoxFit.cover,
              errorBuilder: (
                BuildContext context,
                Object exception,
                StackTrace? stackTrace,
              ) {
                return const ImageNetworkError();
              },
            ),
          ),
          Text(
            name,
            style: TextStyles.font16Bold,
          ),
          Icon(
            Icons.arrow_forward_ios_rounded,
            size: AppSize.s20,
            color: ColorsManager.white,
          )
        ],
      ),
    );
  }
}
