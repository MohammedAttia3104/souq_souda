import 'package:souq_souda/gold/domain/entities/gold_price_entity.dart';

class GoldPriceModel extends GoldPriceEntity {
  const GoldPriceModel({
    required super.price,
    required super.buyPrice,
  });

  factory GoldPriceModel.fromJson(Map<String, dynamic> json) {
    return GoldPriceModel(
      price: json['price'].toDouble(),
      buyPrice: json['buy_price'].toDouble(),
    );
  }
}
