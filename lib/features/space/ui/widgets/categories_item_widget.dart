import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mentorship_b1/features/space/models/category_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/themes/colors_manager.dart';
import '../../../../core/themes/styles.dart';

class CategoriesItemWidget extends StatelessWidget {
  final CategoryModel categoryModel;

  const CategoriesItemWidget({
    super.key,
    required this.categoryModel,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushNamed(categoryModel.routeName);
      },
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Container(
            height: 150.h,
            width: MediaQuery.of(context).size.width * 0.5 - 25,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
            ),
            clipBehavior: Clip.antiAlias,
            child: CachedNetworkImage(
              imageUrl: categoryModel.image,
              fit: BoxFit.cover,
              placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10.r),
                bottomRight: Radius.circular(10.r),
              ),
              color: ColorsManager.black.withOpacity(0.5),
            ),
            height: 30.h,
            width: MediaQuery.of(context).size.width * 0.5 - 25,
            padding: EdgeInsets.only(
              left: 5.w,
              // right: 20.w,
              // top: 10.h,
              bottom: 5.h,
            ),
            child: Text(
              categoryModel.text,
              style: TextStyles.font16Bold,
            ),
          ),
        ],
      ),
    );
  }
}
