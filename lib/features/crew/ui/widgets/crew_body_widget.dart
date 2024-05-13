import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mentorship_b1/features/crew/ui/widgets/crew_loaded_widget.dart';

import '../../../../core/themes/styles.dart';
import '../../logic/crew_cubit.dart';

class CrewBodyWidget extends StatelessWidget {
  const CrewBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CrewCubit, CrewState>(builder: (context, state) {
      if (state is CrewLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is CrewLoaded) {
        return CrewLoadedWidget(crew: state.crew);
      } else if (state is CrewError) {
        return Center(
          child: Text(
            state.error,
            style: TextStyles.font20Bold,
          ),
        );
      } else {
        return const SizedBox();
      }
    });
  }
}
