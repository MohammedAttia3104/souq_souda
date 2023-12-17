import 'package:dartz/dartz.dart';
import 'package:souq_souda/core/errors/failure.dart';
import 'package:souq_souda/core/usecase/base_use_case.dart';
import 'package:souq_souda/gold/domain/entities/ingots_and_coins_entity.dart';
import 'package:souq_souda/gold/domain/repositories/base_ingots_and_coins_repository.dart';

class GetIngotsUseCase
    extends BaseUseCase<List<IngotsAndCoinsEntity>, NoParameters> {
  final BaseIngotsAndCoinsRepository baseIngotsAndCoinsRepository;

  GetIngotsUseCase(this.baseIngotsAndCoinsRepository);

  @override
  Future<Either<Failure, List<IngotsAndCoinsEntity>>> call(
      NoParameters parameters) async {
    return await baseIngotsAndCoinsRepository.getIngots();
  }
}
