import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/models/about_company_model.dart';
import '../data/repo/about_company_repo.dart';

part 'company_state.dart';

class CompanyCubit extends Cubit<CompanyState> {
  CompanyCubit(this.aboutCompanyRepo) : super(CompanyInitial());
  final AboutCompanyRepo aboutCompanyRepo;

  Future<void> getAboutCompany() async {
    emit(CompanyLoading());
    final result = await aboutCompanyRepo.getAboutCompany();
    result.fold(
      (error) => emit(CompanyError(error.message)),
      (company) => emit(CompanyLoaded(company)),
    );
  }
}
