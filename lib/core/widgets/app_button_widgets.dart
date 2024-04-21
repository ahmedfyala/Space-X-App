import 'package:flutter/material.dart';

class AppButtonWidget extends StatelessWidget {
  final double height;
  final double width;
  final String title;
  final void Function()? onPressed;
  final TextStyle textStyle;

  const AppButtonWidget({
    super.key,
    required this.height,
    required this.width,
    required this.title,
    this.onPressed,
    required this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(title,style: textStyle,),
      ),
    );
  }
}
