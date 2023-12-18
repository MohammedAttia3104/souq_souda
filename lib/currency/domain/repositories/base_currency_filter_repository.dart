import 'package:dartz/dartz.dart';
import 'package:souq_souda/core/errors/failure.dart';
import 'package:souq_souda/currency/domain/entities/currency_filter_entity.dart';
import 'package:souq_souda/currency/domain/use_cases/draw_live_currency_chart_use_case.dart';

abstract class BaseCurrencyFilterRepository{
  Future<Either<Failure,List<CurrencyFilterEntity>>> drawLiveCurrencyChart(ChartParameters parameters);
  Future<Either<Failure,List<CurrencyFilterEntity>>> drawBlackCurrencyChart(ChartParameters parameters);
}