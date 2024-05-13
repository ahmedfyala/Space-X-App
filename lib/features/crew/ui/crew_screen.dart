import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mentorship_b1/core/di/dependency_injection.dart';
import 'package:flutter_mentorship_b1/features/crew/ui/widgets/crew_body_widget.dart';

import '../../../core/themes/styles.dart';
import '../logic/crew_cubit.dart';

class CrewScreen extends StatelessWidget {
  const CrewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => getIt<CrewCubit>()..getCrew(),
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Crew',
              style: TextStyles.font24Bold,
            ),
          ),
          body: const CrewBodyWidget(),
        ));
  }
}
