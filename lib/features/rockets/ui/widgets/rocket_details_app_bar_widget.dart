import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/helpers/spaces.dart';
import '../../../../core/themes/colors_manager.dart';
import '../../../../core/themes/styles.dart';
import '../../data/modes/rocket_model.dart';

AppBar rocketDetailsAppBarWidget(RocketModel rocket) =>  AppBar(
  title: Text(
    rocket.name!,
    style: TextStyles.font20Bold,
  ),
  actions: [
    IconButton(
      onPressed: () async {
        final Uri url = Uri.parse(rocket.wikipedia!);

        if (!await launchUrl(url)) {
          throw Exception('Could not launch $url');
        }
      },
      icon: const Icon(
        Icons.link_rounded,
        color: ColorsManager.primary,
        size: 24,
      ),
    ),
    horizontalSpace(15.w),
  ],
);