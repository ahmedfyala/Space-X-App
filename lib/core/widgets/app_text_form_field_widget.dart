import 'package:flutter/material.dart';
import 'package:flutter_mentorship_b1/core/themes/colors_manager.dart';
import 'package:flutter_mentorship_b1/core/themes/styles.dart';

class AppTextFormFieldWidget extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final TextInputType textInputType;
  bool? obscureText;
  final String? Function(String?)? validator;
  final IconData? icon;

  AppTextFormFieldWidget({
    super.key,
    required this.hintText,
    required this.controller,
    required this.textInputType,
    this.obscureText,
    this.validator,
    this.icon,
  });

  @override
  State<AppTextFormFieldWidget> createState() => _AppTextFormFieldWidgetState();
}

class _AppTextFormFieldWidgetState extends State<AppTextFormFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: widget.textInputType,
      cursorColor: ColorsManager.primary,
      style: TextStyles.font16light,
      validator: widget.validator,
      obscureText: widget.obscureText ?? false,
      decoration: InputDecoration(
        hintText: widget.hintText,
        prefixIcon: widget.icon == null ? null : Icon(widget.icon),
        suffixIcon: widget.obscureText != null
            ? IconButton(
                icon: Icon(
                  widget.obscureText!
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_rounded,
                  color: ColorsManager.white,
                ),
                onPressed: () {
                  widget.obscureText = !widget.obscureText!;
                  setState(() {});
                },
              )
            : null,
      ),
    );
  }
}
