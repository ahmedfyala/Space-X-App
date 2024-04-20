import 'package:flutter/material.dart';
import 'package:flutter_mentorship_b1/core/constants/app_strings.dart';
import 'package:flutter_mentorship_b1/core/helpers/extensions.dart';
import 'package:flutter_mentorship_b1/core/routing/routes.dart';
import 'package:flutter_mentorship_b1/features/space/logic/category_data.dart';
import 'package:flutter_mentorship_b1/features/space/ui/widgets/categories_list_widget.dart';
import 'package:flutter_mentorship_b1/features/space/ui/widgets/title_row_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Space extends StatelessWidget {
  const Space({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TitleRowWidget(
                title: AppStrings.categories,
                onTap: () {

                },
              ),
              SizedBox(
                height: 30.h,
              ),
              CategoriesListWidget(
                categories: categories,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
