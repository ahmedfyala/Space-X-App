import 'package:flutter/material.dart';
import 'package:flutter_mentorship_b1/core/themes/colors_manager.dart';
import 'package:flutter_mentorship_b1/core/themes/styles.dart';

class AppTextFormFieldWidget extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final TextInputType textInputType;
  final bool? obscureText;
  final String? Function(String?)? validator;

  const AppTextFormFieldWidget({
    super.key,
    required this.hintText,
    required this.controller,
    required this.textInputType,
    this.obscureText,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: textInputType,
      cursorColor: ColorsManager.primary,
      style: TextStyles.font16light,
      validator: validator,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        hintText: hintText,
      ),
    );
  }
}
