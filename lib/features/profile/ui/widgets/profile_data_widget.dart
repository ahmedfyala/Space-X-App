import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/helpers/spaces.dart';
import '../../../../core/themes/styles.dart';
import '../../logic/profile_cubit.dart';

class ProfileDataWidget extends StatelessWidget {
  const ProfileDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is ProfileSuccess) {
          return Column(
            children: [
              Container(
                height: 100.h,
                width: 100.h,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Image.network(
                  AppPng.user,
                  fit: BoxFit.cover,
                ),
              ),
              verticalSpace(10.h),
              Text(
                context.read<ProfileCubit>().name ?? '',
                style: TextStyles.font20Bold,
              ),
              verticalSpace(10.h),
              Text(
                context.read<ProfileCubit>().email ?? '',
                style: TextStyles.font16Regular,
              ),
              verticalSpace(20.h),
            ],
          );
        } else if (state is ProfileError) {
          return Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(state.error),
                horizontalSpace(10.h),
                IconButton(
                  onPressed: () {
                    context.read<ProfileCubit>().getUserData();
                  },
                  icon: const Icon(Icons.refresh),
                ),
              ],
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
