import 'package:equatable/equatable.dart';
import 'package:souq_souda/gold/domain/entities/gold_price_entity.dart';

class GoldEntity extends Equatable {
  final int id;
  final String name;
  final String icon;
  final String karat;
  final GoldPriceEntity goldPrice;

  const GoldEntity({
    required this.id,
    required this.name,
    required this.icon,
    required this.karat,
    required this.goldPrice,
  });

  @override
  List<Object> get props => [
        id,
        name,
        icon,
        karat,
        goldPrice,
      ];
}
