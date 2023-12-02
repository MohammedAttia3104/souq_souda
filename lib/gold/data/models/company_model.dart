import 'package:souq_souda/gold/domain/entities/company_entity.dart';

class CompanyModel extends CompanyEntity {
  const CompanyModel({
    required super.id,
    required super.name,
    required super.image,
  });

  factory CompanyModel.fromJson(Map<String, dynamic> json) {
    return CompanyModel(
      id: json["id"],
      name: json["name"],
      image: json["image"],
    );
  }
}
