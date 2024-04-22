import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MoreImagesListWidget extends StatelessWidget {
  final List<String> flickrImages;

  const MoreImagesListWidget({super.key, required this.flickrImages});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.r),
          ),
          margin: EdgeInsets.symmetric(
            horizontal: 5.w,
          ),
          clipBehavior: Clip.antiAlias,
          child: Image.network(
            flickrImages[index],
            fit: BoxFit.fill,
          ),
        ),
        itemCount: flickrImages.length,
      ),
    );
  }
}
