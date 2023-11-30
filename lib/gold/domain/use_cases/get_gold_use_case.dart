import 'package:dartz/dartz.dart';
import 'package:souq_souda/core/errors/failure.dart';
import 'package:souq_souda/core/usecase/base_use_case.dart';
import 'package:souq_souda/gold/domain/entities/gold_entity.dart';
import 'package:souq_souda/gold/domain/repositories/base_gold_repository.dart';

class GetGoldUseCase extends BaseUseCase<List<GoldEntity>, NoParameters> {
  final BaseGoldRepository baseGoldRepository;

  GetGoldUseCase(this.baseGoldRepository);

  @override
  Future<Either<Failure, List<GoldEntity>>> call(
      NoParameters parameters) async {
    return await baseGoldRepository.getGold();
  }
}
