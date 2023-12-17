import 'package:dartz/dartz.dart';
import 'package:souq_souda/core/errors/exceptions.dart';
import 'package:souq_souda/core/errors/failure.dart';
import 'package:souq_souda/gold/data/data_sources/ingots_and_coins_remote_data_source.dart';
import 'package:souq_souda/gold/domain/entities/ingots_and_coins_entity.dart';
import 'package:souq_souda/gold/domain/repositories/base_ingots_and_coins_repository.dart';

class IngotsAndCoinsRepository extends BaseIngotsAndCoinsRepository {
  final BaseIngotsAndCoinsRemoteDataSource baseIngotsAndCoinsRemoteDataSource;

  IngotsAndCoinsRepository(this.baseIngotsAndCoinsRemoteDataSource);

  @override
  Future<Either<Failure, List<IngotsAndCoinsEntity>>> getCoins() async {
    final result = await baseIngotsAndCoinsRemoteDataSource.getCoins();
    try {
      return Right(result);
    } on ServerException catch (f) {
      return Left(ServerFailure(f.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<IngotsAndCoinsEntity>>> getIngots() async {
    final result = await baseIngotsAndCoinsRemoteDataSource.getIngots();
    try {
      return Right(result);
    } on ServerException catch (f) {
      return Left(ServerFailure(f.errorMessageModel.statusMessage));
    }
  }
}
