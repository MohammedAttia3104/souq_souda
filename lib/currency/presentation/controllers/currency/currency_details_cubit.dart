import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:souq_souda/core/usecase/base_use_case.dart';
import 'package:souq_souda/currency/domain/entities/currency_entity.dart';
import 'package:souq_souda/currency/domain/use_cases/get_currency_details_use_case.dart';

part 'currency_details_state.dart';

class CurrencyDetailsCubit extends Cubit<CurrencyDetailsState> {
  final GetCurrencyDetailsUseCase getCurrencyDetailsUseCase;

  CurrencyDetailsCubit(
    this.getCurrencyDetailsUseCase,
  ) : super(CurrencyDetailsInitial());

  void getCurrencyDetails() async {
    emit(CurrencyDetailsLoadingState());
    final result = await getCurrencyDetailsUseCase(const NoParameters());
    result.fold(
      (l) => emit(CurrencyDetailsErrorState(error: l.message)),
      (r) => emit(CurrencyDetailsSuccessState(r)),
    );
  }
}
