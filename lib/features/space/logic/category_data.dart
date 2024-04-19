import 'package:flutter/material.dart';

import '../../../core/constants/app_strings.dart';
import '../models/category_model.dart';

List<CategoryModel> categories = [
  CategoryModel(
    icon: Icons.rocket_launch_rounded,
    text: AppStrings.rockets,
  ),
  CategoryModel(
    icon: Icons.directions_boat_filled_rounded,
    text: AppStrings.ships,
  ),
  CategoryModel(
    icon: Icons.rocket_launch_outlined,
    text: AppStrings.launches,
  ),
];
