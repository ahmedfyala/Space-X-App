import 'package:flutter/material.dart';
import 'package:flutter_mentorship_b1/features/space/ui/widgets/categories_item_widget.dart';

import '../../logic/category_data.dart';

class CategoriesListWidget extends StatelessWidget {

  const CategoriesListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 1.05,
          ),
          itemBuilder: (context, index) =>
              CategoriesItemWidget(categoryModel: categories[index]),
          itemCount: categories.length,
          physics: const NeverScrollableScrollPhysics(),
        ),
      ),
    );
  }
}
