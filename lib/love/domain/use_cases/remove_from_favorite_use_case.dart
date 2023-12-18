import 'package:dartz/dartz.dart';
import 'package:souq_souda/core/errors/failure.dart';
import 'package:souq_souda/core/usecase/base_use_case.dart';
import 'package:souq_souda/love/domain/entities/favorite_entity.dart';
import 'package:souq_souda/love/domain/repositories/base_fav_repository.dart';
import 'package:souq_souda/love/domain/use_cases/add_to_favorite_use_case.dart';

class RemoveFromFavoriteUseCase
    extends BaseUseCase<FavoriteEntity, FavoriteParameters> {
  final BaseFavoriteRepository baseFavRepository;

  RemoveFromFavoriteUseCase(this.baseFavRepository);

  @override
  Future<Either<Failure, FavoriteEntity>> call(
      FavoriteParameters parameters) async {
    return await baseFavRepository.removeFromFavorites(parameters);
  }
}
