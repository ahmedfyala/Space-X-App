import 'package:flutter/material.dart';

import '../../../../core/themes/colors_manager.dart';
import '../../../../core/themes/styles.dart';

class DragonsDetailsBoxWidget extends StatelessWidget {
  final String text;
  const DragonsDetailsBoxWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorsManager.lightBlack,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(15),
      child: Text(
        text,
        style: TextStyles.font14Regular,
      ),
    );
  }
}
