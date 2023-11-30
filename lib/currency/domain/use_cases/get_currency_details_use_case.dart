import 'package:dartz/dartz.dart';
import 'package:souq_souda/core/errors/failure.dart';
import 'package:souq_souda/core/usecase/base_use_case.dart';
import 'package:souq_souda/currency/domain/entities/currency_entity.dart';
import 'package:souq_souda/currency/domain/repositories/base_currency_repository.dart';

class GetCurrencyDetailsUseCase
    extends BaseUseCase<List<CurrencyEntity>, NoParameters> {
  final BaseCurrencyRepository baseCurrencyRepository;

  GetCurrencyDetailsUseCase(this.baseCurrencyRepository);

  @override
  Future<Either<Failure, List<CurrencyEntity>>> call(
      NoParameters parameters) async {
    return await baseCurrencyRepository.getCurrencyDetails();
  }
}
