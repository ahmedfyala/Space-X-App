import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/themes/colors_manager.dart';

class DragonDetailsImagesWidget extends StatelessWidget {
  final String id;
  final List<String> flickrImages;

  const DragonDetailsImagesWidget({
    super.key,
    required this.id,
    required this.flickrImages,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250.h,
      child: Hero(
        tag: id,
        child: PageView.builder(
          itemCount: flickrImages.length,
          itemBuilder: (context, index) => Container(
            margin: EdgeInsets.symmetric(
              horizontal: 10.w,
            ),
            decoration: BoxDecoration(
              color: ColorsManager.lightBlack,
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage(flickrImages[index]),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
