import 'package:souq_souda/currency/data/models/price_model.dart';
import 'package:souq_souda/currency/domain/entities/currency_entity.dart';

class CurrencyModel extends CurrencyEntity {
  const CurrencyModel({
    required super.id,
    required super.icon,
    required super.name,
    required super.sort,
    required super.code,
    required super.lastUpdate,
    required super.updateAt,
    required super.bankPrices,
    required super.blackMarketPrices,
    required super.liveMarketPrices,
  });

  factory CurrencyModel.fromJson(Map<String, dynamic> json) {
    return CurrencyModel(
      id: json['id'],
      icon: json['icon'],
      name: json['name'],
      sort: json['sort'],
      code: json['code'],
      lastUpdate: json['last_update'],
      updateAt: json['updated_at'],
      bankPrices: (json["bank_prices"] as List)
          .map((json) => PriceModel.fromJson(json))
          .toList(),
      blackMarketPrices: (json["black_market_prices"] as List)
          .map((json) => PriceModel.fromJson(json))
          .toList(),
      liveMarketPrices: (json["live_prices"] as List)
          .map((json) => PriceModel.fromJson(json))
          .toList(),
    );
  }
}
