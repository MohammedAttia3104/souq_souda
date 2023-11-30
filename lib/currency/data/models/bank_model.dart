import 'package:souq_souda/currency/domain/entities/bank_entity.dart';

class BankModel extends BankEntity {
  const BankModel({
    required super.id,
    required super.icon,
    required super.name,
    required super.shortName,
  });

  factory BankModel.fromJson(Map<String, dynamic> json) {
    return BankModel(
      id: json["id"],
      icon: json["icon"],
      name: json["name"],
      shortName: json["shortname"],
    );
  }
}
