import 'package:flutter_mentorship_b1/core/constants/app_assets.dart';

import '../../../core/constants/app_strings.dart';
import '../../../core/routing/routes.dart';
import '../models/category_model.dart';

List<CategoryModel> categories = [
  CategoryModel(
    image: AppImages.rocketCategory,
    text: AppStrings.rockets,
    routeName: Routes.allRockets,
  ),
  CategoryModel(
    image: AppImages.shipsCategory,
    text: AppStrings.ships,
    routeName: Routes.ships,
  ),
  CategoryModel(
    image: AppImages.dragonsCategory,
    text: AppStrings.dragons,
    routeName: Routes.dragons,
  ),
  CategoryModel(
    image: AppImages.launchesCategory,
    text: AppStrings.launches,
    routeName: Routes.launches,
  ),
];
