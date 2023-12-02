part of 'company_cubit.dart';

@immutable
abstract class CompanyState {}

class CompanyInitial extends CompanyState {}

class CompanyLoadingState extends CompanyState {}

class CompanySuccessState extends CompanyState {
  List<CompanyEntity> companies = [];

  CompanySuccessState(this.companies);
}

class CompanyErrorState extends CompanyState {
  final String error;

  CompanyErrorState(this.error);
}
