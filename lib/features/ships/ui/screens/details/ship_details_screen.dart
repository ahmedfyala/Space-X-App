
import 'package:flutter/material.dart';
import 'package:flutter_mentorship_b1/core/themes/size_manager.dart';
import 'package:flutter_mentorship_b1/core/themes/styles.dart';
import 'package:flutter_mentorship_b1/features/ships/data/models/ship_model.dart';

import '../../widgets/details_screen_body.dart';

class ShipDetailsScreen extends StatelessWidget {
  final ShipModel shipModel;

  const ShipDetailsScreen({super.key, required this.shipModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          shipModel.shipName.toString(),
          style: TextStyles.font24Bold,
        ),
      ),
      body:  Padding(
        padding:  EdgeInsets.all(AppPadding.p20),
        child: DetailsScreenBody(shipModel: shipModel,),
      )
    );
  }
}
