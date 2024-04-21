import 'package:flutter/material.dart';

class WelcomeTextWidget extends StatelessWidget {
  final String title;
  final TextStyle textStyle;

  const WelcomeTextWidget({
    super.key,
    required this.title,
    required this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Text(title,style: textStyle,);
  }
}
