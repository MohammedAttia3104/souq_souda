import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:souq_souda/core/errors/failure.dart';
import 'package:souq_souda/core/usecase/base_use_case.dart';
import 'package:souq_souda/currency/domain/entities/currency_filter_entity.dart';
import 'package:souq_souda/currency/domain/repositories/base_currency_filter_repository.dart';

class DrawLiveCurrencyChartUseCase
    extends BaseUseCase<List<CurrencyFilterEntity>, ChartParameters> {
  final BaseCurrencyFilterRepository baseCurrencyFilterRepository;

  DrawLiveCurrencyChartUseCase(this.baseCurrencyFilterRepository);

  @override
  Future<Either<Failure, List<CurrencyFilterEntity>>> call(
    ChartParameters parameters,
  ) async {
    return await baseCurrencyFilterRepository.drawLiveCurrencyChart(parameters);
  }
}

class ChartParameters extends Equatable {
  final int currencyId;
  final DateTime date;
  final String type;

  const ChartParameters({
    required this.currencyId,
    required this.date,
    required this.type,
  });

  Map<String, dynamic> toJson() {
    return {
      "currency_id": currencyId,
      "start_date": date.toIso8601String(),
      "type": type,
    };
  }

  @override
  List<Object> get props => [
        currencyId,
        date,
        type,
      ];
}
