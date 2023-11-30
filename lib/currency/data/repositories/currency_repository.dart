import 'package:dartz/dartz.dart';
import 'package:souq_souda/core/errors/exceptions.dart';
import 'package:souq_souda/core/errors/failure.dart';
import 'package:souq_souda/currency/data/data_sources/remote_currency_data_source.dart';
import 'package:souq_souda/currency/domain/entities/bank_entity.dart';
import 'package:souq_souda/currency/domain/entities/currency_entity.dart';
import 'package:souq_souda/currency/domain/repositories/base_currency_repository.dart';

class CurrencyRepository extends BaseCurrencyRepository {
  final BaseCurrencyRemoteDataSource baseCurrencyRemoteDataSource;

  CurrencyRepository(
    this.baseCurrencyRemoteDataSource,
  );

  @override
  Future<Either<Failure, List<CurrencyEntity>>> getCurrencyDetails() async {
    final result = await baseCurrencyRemoteDataSource.getCurrencyDetails();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<BankEntity>>> getBanks() async {
    final result = await baseCurrencyRemoteDataSource.getBanks();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
}
