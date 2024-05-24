import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mentorship_b1/features/about_company/ui/widgets/company_loaded_widget.dart';

import '../../../core/themes/styles.dart';
import '../logic/company_cubit.dart';

class AboutCompanyScreen extends StatelessWidget {
  const AboutCompanyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'SpaceX',
          style: TextStyles.font24Bold,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: BlocBuilder<CompanyCubit, CompanyState>(
          builder: (context, state) {
            if (state is CompanyLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is CompanyError) {
              return Center(
                child: Text(
                  state.error,
                  style: TextStyles.font16Bold,
                ),
              );
            }
            if (state is CompanyLoaded) {
              return CompanyLoadedWidget(company: state.company);
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
