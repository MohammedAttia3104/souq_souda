import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';
import 'package:souq_souda/core/errors/exceptions.dart';
import 'package:souq_souda/core/errors/failure.dart';
import 'package:souq_souda/gold/data/data_sources/gold_remote_data_source.dart';
import 'package:souq_souda/gold/domain/entities/gold_entity.dart';
import 'package:souq_souda/gold/domain/repositories/base_gold_repository.dart';

class GoldRepository extends BaseGoldRepository {
  final BaseGoldRemoteDataSource baseGoldRemoteDataSource;

  GoldRepository(this.baseGoldRemoteDataSource);

  @override
  Future<Either<Failure, List<GoldEntity>>> getGold() async {
    final result = await baseGoldRemoteDataSource.getGold();
    try {
      return Right(result);
    } on ServerException catch (f) {
      return Left(ServerFailure(f.errorMessageModel.statusMessage));
    }
  }
}
