import 'package:souq_souda/gold/data/models/ingots_and_coins_company_model.dart';
import 'package:souq_souda/gold/data/models/ingots_and_coins_price_model.dart';
import 'package:souq_souda/gold/domain/entities/ingots_and_coins_entity.dart';

class IngotsAndCoinsModel extends IngotsAndCoinsEntity {
  const IngotsAndCoinsModel({
    required super.id,
    required super.baseGoldItem,
    required super.icon,
    required super.name,
    required super.karat,
    required super.weight,
    required super.sort,
    required super.companiesData,
    required super.price,
  });

  factory IngotsAndCoinsModel.fromJson(Map<String, dynamic> json) {
    return IngotsAndCoinsModel(
      id: json['id'],
      baseGoldItem: json['base_gold_item'],
      icon: json['icon'] ?? 'gold-ingots/April2023/lNZUFq1GK0bfHbGm8q2D.jpg',
      name: json['name'],
      karat: json['karat'],
      weight: json['weight'],
      sort: json['sort'],
      companiesData: (json['companies_data'] as List)
          .map((e) => IngotsAndCoinsCompanyModel.fromJson(e))
          .toList(),
      price: IngotsAndCoinsPriceModel.fromJson(json['price']),
    );
  }
}
