import 'package:flutter/material.dart';
import 'package:flutter_mentorship_b1/core/themes/styles.dart';

class ImageNetworkError extends StatelessWidget {
  const ImageNetworkError({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const Icon(
          Icons.error_outline,
          color: Colors.redAccent,
        ),
        Text(
          'Image url is empty',
          style: TextStyles.font12Light,
        )
      ],
    );
  }
}
