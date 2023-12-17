import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:souq_souda/core/usecase/base_use_case.dart';
import 'package:souq_souda/currency/domain/entities/bank_entity.dart';
import 'package:souq_souda/currency/domain/entities/currency_entity.dart';
import 'package:souq_souda/currency/domain/use_cases/draw_black_currency_chart_use_case.dart';
import 'package:souq_souda/currency/domain/use_cases/draw_live_currency_chart_use_case.dart';
import 'package:souq_souda/currency/domain/use_cases/get_banks_use_case.dart';
import 'package:souq_souda/currency/domain/use_cases/get_currency_details_use_case.dart';

import '../../../domain/entities/currency_filter_entity.dart';

part 'currency_details_state.dart';

class CurrencyDetailsCubit extends Cubit<CurrencyDetailsState> {
  final GetCurrencyDetailsUseCase getCurrencyDetailsUseCase;
  final DrawBlackCurrencyChartUseCase drawBlackCurrencyChartUseCase;
  final DrawLiveCurrencyChartUseCase drawLiveCurrencyChartUseCase;
  final GetBanksUseCase getBanksUseCase;

  CurrencyDetailsCubit(
    this.getCurrencyDetailsUseCase,
    this.drawBlackCurrencyChartUseCase,
    this.drawLiveCurrencyChartUseCase,
    this.getBanksUseCase,
  ) : super(CurrencyDetailsInitial());

  CurrencyEntity? currencyEntity;
  List<CurrencyEntity> currencies = [];
  var nowDate = DateTime.now();
  bool isColorChanged = false;

  void getCurrencyDetails() async {
    emit(CurrencyDetailsLoadingState());
    final result = await getCurrencyDetailsUseCase(const NoParameters());
    result.fold(
      (l) => emit(CurrencyDetailsErrorState(error: l.message)),
      (r) {
        currencies = r;
        currencyEntity = r[1];
        emit(CurrencyDetailsSuccessState(currencies));
      },
    );
  }

  void drawBlackCurrencyChart({
    required DateTime startDate,
    String type = 'black',
  }) async {
    final result = await drawBlackCurrencyChartUseCase(
      ChartParameters(
        currencyId: currencyEntity?.id ?? 15,
        date: startDate,
        type: type,
      ),
    );
    result.fold(
      (l) => emit(CurrencyChartErrorState(l.message)),
      (r) => emit(CurrencyChartSuccessState(r)),
    );
  }

  void drawLiveCurrencyChart({
    required DateTime startDate,
    String type = 'live',
  }) async {
    final result = await drawLiveCurrencyChartUseCase(
      ChartParameters(
        currencyId: currencyEntity?.id ?? 15,
        date: startDate,
        type: type,
      ),
    );
    result.fold(
      (l) => emit(CurrencyChartErrorState(l.message)),
      (r) {
        log(r.toString());
        emit(CurrencyChartSuccessState(r));
      },
    );
  }

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
