import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:souq_souda/core/usecase/base_use_case.dart';
import 'package:souq_souda/gold/domain/entities/company_entity.dart';
import 'package:souq_souda/gold/domain/use_cases/get_companies_use_case.dart';

part 'company_state.dart';

class CompanyCubit extends Cubit<CompanyState> {
  final GetCompaniesUseCase getCompanyUseCase;

  CompanyCubit(this.getCompanyUseCase) : super(CompanyInitial());

  CompanyEntity? companyEntity;
  void getCompanies() async {
    emit(CompanyLoadingState());
    final result = await getCompanyUseCase(const NoParameters());
    result.fold(
      (l) => emit(CompanyErrorState(l.message)),
      (r) => emit(CompanySuccessState(r)),
    );
  }
}
