import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mentorship_b1/features/profile/logic/profile_cubit.dart';

import '../../../core/di/dependency_injection.dart';
import 'widgets/profile_body_widget.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ProfileCubit>()..getUserData(),
      child: const ProfileBodyWidget(),
    );
  }
}
