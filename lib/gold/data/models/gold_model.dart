import 'package:souq_souda/gold/data/models/gold_price_model.dart';
import 'package:souq_souda/gold/domain/entities/gold_entity.dart';

class GoldModel extends GoldEntity {
  const GoldModel({
    required super.id,
    required super.name,
    required super.icon,
    required super.karat,
    required super.goldPrice,
  });

  factory GoldModel.fromJson(Map<String, dynamic> json) {
    return GoldModel(
      id: json['id'],
      name: json['name'],
      icon: json['icon'],
      karat: json['karat'],
      goldPrice: GoldPriceModel.fromJson(json['price']),
    );
  }
}
