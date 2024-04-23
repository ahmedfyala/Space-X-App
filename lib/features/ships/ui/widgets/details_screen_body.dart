import 'package:flutter/material.dart';
import 'package:flutter_mentorship_b1/core/themes/size_manager.dart';
import 'package:flutter_mentorship_b1/features/ships/data/models/ship_model.dart';
import 'package:gap/gap.dart';

import 'details_item_widget.dart';
import 'details_text_widget.dart';
import 'image_network_error.dart';

class DetailsScreenBody extends StatelessWidget {
  final ShipModel shipModel;

  const DetailsScreenBody({super.key, required this.shipModel});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(AppRadius.r10),
            child: Hero(
              tag: (shipModel.imageUrl.toString()),
              child: Image.network(
                fit: BoxFit.cover,
                shipModel.imageUrl ?? '',
                errorBuilder: (
                  BuildContext context,
                  Object exception,
                  StackTrace? stackTrace,
                ) {
                  return const ImageNetworkError();
                },
              ),
            ),
          ),
          Gap(AppHeight.h20),
          DetailsItemWidget(
            title: 'Home Port',
            widget: DetailsTextWidget(
              text: shipModel.homePort ?? 'No Content',
            ),
          ),
          Gap(AppHeight.h20),
          DetailsItemWidget(
            title: 'Year Built',
            widget: DetailsTextWidget(
              text: shipModel.yearBuilt.toString(),
            ),
          ),
          Gap(AppHeight.h20),
          DetailsItemWidget(
            title: 'Ship Name',
            widget: DetailsTextWidget(
              text: shipModel.legacyId ?? 'No Content',
            ),
          ),
          Gap(AppHeight.h20),
          DetailsItemWidget(
            title: 'Type',
            widget: DetailsTextWidget(
              text: shipModel.type ?? 'No Content',
            ),
          ),
        ],
      ),
    );
  }
}
