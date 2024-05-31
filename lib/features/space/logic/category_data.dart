import 'package:flutter/material.dart';

import '../../../core/constants/app_strings.dart';
import '../../../core/routing/routes.dart';
import '../models/category_model.dart';

List<CategoryModel> categories = [
  CategoryModel(
    icon: Icons.rocket_launch_rounded,
    text: AppStrings.rockets,
    routeName: Routes.allRockets,
  ),
  CategoryModel(
    icon: Icons.directions_boat_filled_rounded,
    text: AppStrings.ships,
    routeName: Routes.ships,
  ),
  CategoryModel(
    icon: Icons.rocket_launch_outlined,
    text: AppStrings.dragons,
    routeName: Routes.dragons,
  ),
];
