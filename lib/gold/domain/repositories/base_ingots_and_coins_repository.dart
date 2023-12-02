import 'package:dartz/dartz.dart';
import 'package:souq_souda/core/errors/failure.dart';
import 'package:souq_souda/gold/domain/entities/ingots_and_coins_entity.dart';

abstract class BaseIngotsAndCoinsRepository {
  Future<Either<Failure, List<IngotsAndCoinsEntity>>> getIngotsAndCoins();
}
