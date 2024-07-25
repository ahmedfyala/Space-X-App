import 'package:flutter/material.dart';

import '../../data/models/dragon_model.dart';
import 'dragon_item_widget.dart';

class DragonsLoadedWidget extends StatelessWidget {
  final List<Dragon> dragons;
  const DragonsLoadedWidget({super.key, required this.dragons});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: dragons.length,
      itemBuilder: (context, index) {
        return DragonItemWidget(dragon: dragons[index]);
      },
    );
  }
}
