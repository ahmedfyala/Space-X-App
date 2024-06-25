import 'package:flutter/material.dart';
import 'package:flutter_mentorship_b1/features/space/ui/widgets/categories_list_widget.dart';
import 'package:flutter_mentorship_b1/features/space/ui/widgets/header_widget.dart';


class Space extends StatelessWidget {
  const Space({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          HeaderWidget(),
          CategoriesListWidget(),
        ],
      ),
    );
  }
}
