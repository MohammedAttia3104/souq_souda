import 'package:dartz/dartz.dart';
import 'package:souq_souda/core/errors/failure.dart';
import 'package:souq_souda/gold/domain/entities/gold_entity.dart';

abstract class BaseGoldRepository {
  Future<Either<Failure, List<GoldEntity>>> getGold();
}
