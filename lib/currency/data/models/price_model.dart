import 'package:souq_souda/currency/domain/entities/currency_price_entity.dart';

class PriceModel extends CurrencyPriceEntity {
  const PriceModel({
    required super.id,
    required super.bankId,
    required super.currencyId,
    required super.buyPrice,
    required super.sellPrice,
    required super.date,
    required super.createdAt,
    required super.updatedAt,
    required super.hour,
    required super.price,
  });

  factory PriceModel.fromJson(Map<String, dynamic> json) {
    return PriceModel(
      id: json['id'],
      bankId: json['bank_id'],
      currencyId: json['currency_id'],
      buyPrice: json['buy_price']?.toDouble(),
      sellPrice: json['sell_price']?.toDouble(),
      date: json['date'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      hour: json['hour'],
      price: json['price']?.toDouble(),
    );
  }
}
