import 'package:dartz/dartz.dart';
import 'package:souq_souda/core/errors/failure.dart';
import 'package:souq_souda/core/usecase/base_use_case.dart';
import 'package:souq_souda/currency/domain/entities/currency_filter_entity.dart';
import 'package:souq_souda/currency/domain/repositories/base_currency_filter_repository.dart';
import 'package:souq_souda/currency/domain/use_cases/draw_live_currency_chart_use_case.dart';

class DrawBlackCurrencyChartUseCase
    extends BaseUseCase<List<CurrencyFilterEntity>, ChartParameters> {
  final BaseCurrencyFilterRepository baseCurrencyFilterRepository;

  DrawBlackCurrencyChartUseCase(this.baseCurrencyFilterRepository);

  @override
  Future<Either<Failure, List<CurrencyFilterEntity>>> call(
      ChartParameters parameters) async {
    return await baseCurrencyFilterRepository
        .drawBlackCurrencyChart(parameters);
  }
}
