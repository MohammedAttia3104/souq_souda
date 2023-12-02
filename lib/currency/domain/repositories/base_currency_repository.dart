import 'package:dartz/dartz.dart';
import 'package:souq_souda/core/errors/failure.dart';
import 'package:souq_souda/currency/domain/entities/currency_entity.dart';

abstract class BaseCurrencyRepository{
  Future<Either<Failure,List<CurrencyEntity>>> getCurrencyDetails();
}