import 'package:souq_souda/gold/domain/entities/ingots_and_coins_company_entity.dart';

class IngotsAndCoinsCompanyModel extends IngotsAndCoinsCompanyEntity {
  const IngotsAndCoinsCompanyModel({
    required super.id,
    required super.companyId,
    required super.coinId,
    required super.workmanship,
    required super.tax,
    required super.returnFees,
    required super.ingotId,
  });

  factory IngotsAndCoinsCompanyModel.fromJson(Map<String, dynamic> json) {
    return IngotsAndCoinsCompanyModel(
      id: json['id'],
      companyId: json['company_id'],
      coinId: json['coin_id'],
      workmanship: json['workmanship'],
      tax: json['tax'],
      returnFees: json['return_fees'],
      ingotId: json['ingot_id'],
    );
  }
}
