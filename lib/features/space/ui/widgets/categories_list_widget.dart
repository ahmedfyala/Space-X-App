import 'package:flutter/material.dart';
import 'package:flutter_mentorship_b1/core/helpers/extensions.dart';
import 'package:flutter_mentorship_b1/features/space/ui/widgets/categories_item_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/routing/routes.dart';
import '../../models/category_model.dart';

class CategoriesListWidget extends StatelessWidget {
  final List<CategoryModel> categories;

  const CategoriesListWidget({
    super.key,
    required this.categories,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 72.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => CategoriesItemWidget(
          categoryModel: categories[index],
        ),
        separatorBuilder: (context, index) => SizedBox(
          width: 30.w,
        ),
        itemCount: categories.length,
      ),
    );
  }
}
