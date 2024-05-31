import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mentorship_b1/core/constants/app_strings.dart';
import 'package:flutter_mentorship_b1/features/dragons/logic/dragon_cubit.dart';

import '../../../core/themes/styles.dart';
import 'widgets/dragons_loaded_widget.dart';

class DragonsScreen extends StatelessWidget {
  const DragonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.dragons,
          style: TextStyles.font24Bold,
        ),
      ),
      body: BlocBuilder<DragonCubit, DragonState>(
        builder: (context, state) {
          if (state is DragonLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is DragonLoaded) {
            return DragonsLoadedWidget(dragons: state.dragons);
          }
          if (state is DragonError) {
            return Center(
              child: Text(
                state.error,
                style: TextStyles.font16BoldError,
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
