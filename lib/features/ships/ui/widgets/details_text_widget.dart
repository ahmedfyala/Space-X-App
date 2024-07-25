import 'package:flutter/material.dart';
import 'package:flutter_mentorship_b1/core/themes/styles.dart';

class DetailsTextWidget extends StatelessWidget {
  final String text;

  const DetailsTextWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyles.font20Bold,
    );
  }
}
