import 'package:dartz/dartz.dart';
import 'package:souq_souda/core/errors/failure.dart';
import 'package:souq_souda/currency/domain/entities/bank_entity.dart';

abstract class BaseBankRepository{
  Future<Either<Failure,List<BankEntity>>> getBanks();

}