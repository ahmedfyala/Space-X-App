import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mentorship_b1/core/helpers/extensions.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/themes/styles.dart';
import '../../../authentication/logic/auth/auth_cubit.dart';
import '../../logic/profle_items_data.dart';
import 'profile_data_widget.dart';
import 'profile_row_item_widget.dart';

class ProfileBodyWidget extends StatelessWidget {
  const ProfileBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is UserUnAuthenticated) {
          context.pushNamedAndRemoveUntil(
            Routes.login,
            predicate: (_) => false,
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppStrings.profile, style: TextStyles.font24Bold),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(
                child: ProfileDataWidget(),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return ProfileRowItemWidget(
                      icon: profileItems[index].icon,
                      title: profileItems[index].title,
                      routeName: profileItems[index].routeName,
                      onTap: (index == profileItems.length - 1)
                          ? () {
                              context.read<AuthCubit>().logOut();
                            }
                          : null,
                    );
                  },
                  childCount: profileItems.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
