import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:souq_souda/core/usecase/base_use_case.dart';
import 'package:souq_souda/currency/domain/entities/bank_entity.dart';
import 'package:souq_souda/currency/domain/use_cases/get_banks_use_case.dart';

part 'bank_state.dart';

class BankCubit extends Cubit<BankState> {
  final GetBanksUseCase getBanksUseCase;

  BankCubit(this.getBanksUseCase) : super(BankInitial());
  bool isColorChanged = false;

  void getBanks() async {
    emit(BanksLoadingState());
    final result = await getBanksUseCase(const NoParameters());
    result.fold(
      (l) => emit(BanksErrorState(error: l.message)),
      (r) => emit(BanksSuccessState(r)),
    );
  }

  void changeCentralBankBackgroundColor() {
    isColorChanged != isColorChanged;
    emit(CentralBankOfEgyptChangedColorState());
  }
}
