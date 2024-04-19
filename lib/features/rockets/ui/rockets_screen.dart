import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mentorship_b1/core/constants/app_strings.dart';
import 'package:flutter_mentorship_b1/core/themes/styles.dart';
import 'package:flutter_mentorship_b1/features/rockets/ui/widgets/no_rockets_founded_widget.dart';
import 'package:flutter_mentorship_b1/features/rockets/ui/widgets/rockets_list_widget.dart';

import '../logic/all_rockets_cubit.dart';

class RocketsScreen extends StatelessWidget {
  const RocketsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.rockets,
          style: TextStyles.font24Bold,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: BlocBuilder<AllRocketsCubit, AllRocketsState>(
          builder: (context, state) {
            if (state is GetAllRocketsError) {
              return Center(
                child: Text(
                  "Error ${state.error}",
                  style: TextStyles.font16Bold,
                ),
              );
            } else if (state is GetAllRocketsSuccess) {
              if (state.rockets.isEmpty) {
                return const NoRocketsFoundedWidget();
              } else {
                return RocketsListWidget(rockets: state.rockets);
              }
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
