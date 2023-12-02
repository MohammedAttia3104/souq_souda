import 'package:souq_souda/gold/domain/entities/ingots_and_coins_price_entity.dart';

class IngotsAndCoinsPriceModel extends IngotsAndCoinsPriceEntity {
  const IngotsAndCoinsPriceModel({
    required super.id,
    required super.goldCoinId,
    required super.goldIngotId,
    required super.buyPrice,
    required super.sellPrice,
  });

  factory IngotsAndCoinsPriceModel.fromJson(Map<String, dynamic> json) {
    return IngotsAndCoinsPriceModel(
      id: json['id'],
      goldCoinId: json['gold_coin_id'],
      goldIngotId: json['gold_ingot_id'],
      buyPrice: json['buy_price'],
      sellPrice: json['sell_price'],
    );
  }
}
