import 'package:dartz/dartz.dart';
import 'package:souq_souda/core/errors/failure.dart';
import 'package:souq_souda/love/domain/entities/favorite_entity.dart';
import 'package:souq_souda/love/domain/use_cases/add_to_favorite_use_case.dart';

abstract class BaseFavoriteRepository {
  Future<Either<Failure, FavoriteEntity>> addToFavorites(
    FavoriteParameters parameters,
  );
  Future<Either<Failure, FavoriteEntity>> removeFromFavorites(
      FavoriteParameters parameters,
      );
}
