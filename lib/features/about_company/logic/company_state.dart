part of 'company_cubit.dart';

sealed class CompanyState {}

final class CompanyInitial extends CompanyState {}

final class CompanyLoading extends CompanyState {}

final class CompanyLoaded extends CompanyState {
  final AboutCompany company;

  CompanyLoaded(this.company);
}

final class CompanyError extends CompanyState {
  final String error;

  CompanyError(this.error);
}
