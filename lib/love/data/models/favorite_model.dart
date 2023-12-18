import 'package:souq_souda/love/domain/entities/favorite_entity.dart';

class FavoriteModel extends FavoriteEntity {
  const FavoriteModel({
    required super.id,
    required super.userId,
    required super.currencyId,
    required super.bankId,
  });

  factory FavoriteModel.fromJson(Map<String, dynamic> json) {
    return FavoriteModel(
      id: json["id"],
      userId: json["user_id"],
      currencyId: json["currency_id"],
      bankId: json["bank_id"],
    );
  }
}
