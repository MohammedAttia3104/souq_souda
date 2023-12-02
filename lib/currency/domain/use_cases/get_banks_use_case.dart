import 'package:dartz/dartz.dart';
import 'package:souq_souda/core/errors/failure.dart';
import 'package:souq_souda/core/usecase/base_use_case.dart';
import 'package:souq_souda/currency/domain/entities/bank_entity.dart';
import 'package:souq_souda/currency/domain/repositories/base_bank_repository.dart';
import 'package:souq_souda/currency/domain/repositories/base_currency_repository.dart';

class GetBanksUseCase extends BaseUseCase<List<BankEntity>, NoParameters> {
  final BaseBankRepository baseBankRepository;

  GetBanksUseCase(this.baseBankRepository);

  @override
  Future<Either<Failure, List<BankEntity>>> call(
      NoParameters parameters) async {
    return await baseBankRepository.getBanks();
  }
}
