import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:souq_souda/core/errors/failure.dart';
import 'package:souq_souda/core/usecase/base_use_case.dart';
import 'package:souq_souda/love/domain/entities/favorite_entity.dart';
import 'package:souq_souda/love/domain/repositories/base_fav_repository.dart';

class AddToFavoriteUseCase extends BaseUseCase<FavoriteEntity, FavoriteParameters> {
  final BaseFavoriteRepository baseFavRepository;

  AddToFavoriteUseCase(this.baseFavRepository);

  @override
  Future<Either<Failure, FavoriteEntity>> call(
      FavoriteParameters parameters) async {
    return await baseFavRepository.addToFavorites(parameters);
  }
}

class FavoriteParameters extends Equatable {
  final int currencyId;
  final int bankId;

  const FavoriteParameters({
    required this.currencyId,
    required this.bankId,
  });

  Map<String, dynamic> toJson() {
    return {
      "currency_id": currencyId,
      "bank_id": bankId,
    };
  }

  @override
  List<Object> get props => [
        currencyId,
        bankId,
      ];
}
