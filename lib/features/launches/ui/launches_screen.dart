import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mentorship_b1/core/widgets/loading_widget.dart';

import '../../../core/constants/app_strings.dart';
import '../../../core/themes/styles.dart';
import '../logic/launches_cubit.dart';
import 'widgets/launches_loaded_widget.dart';

class LaunchesScreen extends StatelessWidget {
  const LaunchesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.launches,
          style: TextStyles.font24Bold,
        ),
      ),
      body:
          BlocBuilder<LaunchesCubit, LaunchesState>(builder: (context, state) {
        if (state is LaunchesLoading) {
          return const LoadingWidget();
        } else if (state is LaunchesLoaded) {
          return LaunchesLoadedWidget(launches: state.launches);
        }
        if (state is LaunchesError) {
          return Center(
            child: Text(
              state.error,
              style: TextStyles.font16BoldError,
            ),
          );
        }
        return Container();
      }),
    );
  }
}
