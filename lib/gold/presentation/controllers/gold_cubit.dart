import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:souq_souda/core/usecase/base_use_case.dart';
import 'package:souq_souda/gold/domain/entities/gold_entity.dart';
import 'package:souq_souda/gold/domain/use_cases/get_gold_use_case.dart';

part 'gold_state.dart';

class GoldCubit extends Cubit<GoldState> {
  final GetGoldUseCase getGoldUseCase;

  GoldCubit(this.getGoldUseCase) : super(GoldInitial());

  void getGold() async {
    final result = await getGoldUseCase(const NoParameters());
    result.fold(
      (l) => emit(GoldErrorState(l.message)),
      (r) => emit(GoldSuccessState(r)),
    );
  }
}
