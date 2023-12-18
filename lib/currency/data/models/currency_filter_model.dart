import 'package:souq_souda/currency/domain/entities/currency_filter_entity.dart';

class CurrencyFilterModel extends CurrencyFilterEntity {
  const CurrencyFilterModel({
    required super.currencyId,
    required super.price,
    required super.date,
    required super.hour,
  });

  factory CurrencyFilterModel.fromJson(Map<String, dynamic> json) {
    return CurrencyFilterModel(
      currencyId: json["currency_id"].toInt(),
      price: json["price"].toDouble(),
      date: json["date"],
      hour: json['hour'] ?? 0,
    );
  }
}

