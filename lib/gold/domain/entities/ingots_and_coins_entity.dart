import 'package:equatable/equatable.dart';
import 'package:souq_souda/gold/domain/entities/ingots_and_coins_company_entity.dart';
import 'package:souq_souda/gold/domain/entities/ingots_and_coins_price_entity.dart';

class IngotsAndCoinsEntity extends Equatable {
  final int id;
  final int baseGoldItem;
  final String icon;
  final String name;
  final String karat;
  final num weight;
  final int sort;
  final List<IngotsAndCoinsCompanyEntity> companiesData;
  final IngotsAndCoinsPriceEntity price;

  const IngotsAndCoinsEntity({
    required this.id,
    required this.baseGoldItem,
    required this.icon,
    required this.name,
    required this.karat,
    required this.weight,
    required this.sort,
    required this.companiesData,
    required this.price,
  });

  @override
  List<Object> get props => [
        id,
        baseGoldItem,
        icon,
        name,
        karat,
        weight,
        sort,
        companiesData,
        price,
      ];
}
