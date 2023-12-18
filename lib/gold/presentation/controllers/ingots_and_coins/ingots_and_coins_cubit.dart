import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:souq_souda/core/usecase/base_use_case.dart';
import 'package:souq_souda/gold/domain/entities/ingots_and_coins_entity.dart';
import 'package:souq_souda/gold/domain/use_cases/get_coins_use_case.dart';
import 'package:souq_souda/gold/domain/use_cases/get_ingots_use_case.dart';

part 'ingots_and_coins_state.dart';

class IngotsAndCoinsCubit extends Cubit<IngotsAndCoinsState> {
  final GetIngotsUseCase getIngotsUseCase;
  final GetCoinsUseCase getCoinsUseCase;

  IngotsAndCoinsCubit(
    this.getIngotsUseCase,
    this.getCoinsUseCase,
  ) : super(IngotsAndCoinsInitial());

  void getIngots() async {
    emit(IngotsLoadingState());
    final result = await getIngotsUseCase(const NoParameters());
    result.fold(
      (l) => emit(IngotsErrorState(l.message)),
      (r) => emit(IngotsSuccessState(r)),
    );
  }

  // void getCoins() async {
  //   emit(CoinsLoadingState());
  //   final result = await getCoinsUseCase(const NoParameters());
  //   result.fold(
  //     (l) => emit(CoinsErrorState(l.message)),
  //     (r) => emit(CoinsSuccessState(r)),
  //   );
  // }
}
