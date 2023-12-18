import 'package:dartz/dartz.dart';
import 'package:souq_souda/core/errors/exceptions.dart';
import 'package:souq_souda/core/errors/failure.dart';
import 'package:souq_souda/love/data/data_sources/favorite_remote_data_source.dart';
import 'package:souq_souda/love/domain/entities/favorite_entity.dart';
import 'package:souq_souda/love/domain/repositories/base_fav_repository.dart';
import 'package:souq_souda/love/domain/use_cases/add_to_favorite_use_case.dart';

class FavoriteRepository extends BaseFavoriteRepository {
  final BaseFavoriteRemoteDataSource baseFavoriteRemoteDataSource;

  FavoriteRepository(this.baseFavoriteRemoteDataSource);

  @override
  Future<Either<Failure, FavoriteEntity>> addToFavorites(
      FavoriteParameters parameters) async {
    final result =
        await baseFavoriteRemoteDataSource.addToFavorites(parameters);
    try {
      return Right(result);
    } on ServerException catch (f) {
      return Left(ServerFailure(f.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, FavoriteEntity>> removeFromFavorites(
      FavoriteParameters parameters) async {
    final result =
        await baseFavoriteRemoteDataSource.removeFromFavorites(parameters);
    try {
      return Right(result);
    } on ServerException catch (f) {
      return Left(ServerFailure(f.errorMessageModel.statusMessage));
    }
  }
}
