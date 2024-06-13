import 'package:dartz/dartz.dart';
import 'package:souq_souda/core/errors/exceptions.dart';
import 'package:souq_souda/core/errors/failure.dart';
import 'package:souq_souda/currency/data/data_sources/bank_remote_data_source.dart';
import 'package:souq_souda/currency/domain/entities/bank_entity.dart';
import 'package:souq_souda/currency/domain/repositories/base_bank_repository.dart';

class BankRepository extends BaseBankRepository {
  final BaseBankRemoteDataSource baseBankRemoteDataSource;

  BankRepository(this.baseBankRemoteDataSource);

  @override
  Future<Either<Failure, List<BankEntity>>> getBanks() async {
    final result = await baseBankRemoteDataSource.getBanks();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
}
