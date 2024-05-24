import 'package:flutter/material.dart';
import 'package:flutter_mentorship_b1/core/constants/app_strings.dart';
import 'package:flutter_mentorship_b1/features/profile/data/models/profile_item_model.dart';

import '../../../core/routing/routes.dart';

List<ProfileItemModel> profileItems = [
  ProfileItemModel(
    icon: Icons.favorite_rounded,
    title: AppStrings.favorite,
    routeName: '',
  ),
  ProfileItemModel(
    icon: Icons.business_rounded,
    title: AppStrings.aboutCompany,
    routeName: Routes.aboutCompany,
  ),
  ProfileItemModel(
    icon: Icons.people_rounded,
    title: AppStrings.ourTeam,
    routeName: Routes.developersTeam,
  ),
  ProfileItemModel(
    icon: Icons.logout_rounded,
    title: AppStrings.logout,
    routeName: '',
  ),
];
