import 'package:equatable/equatable.dart';
import 'package:souq_souda/currency/domain/entities/currency_price_entity.dart';

class CurrencyEntity extends Equatable {
  final int id;
  final String icon;
  final String name;
  final int sort;
  final String code;
  final String lastUpdate;
  final String updateAt;
  final List<CurrencyPriceEntity> bankPrices;
  final List<CurrencyPriceEntity> blackMarketPrices;
  final List<CurrencyPriceEntity> liveMarketPrices;

  const CurrencyEntity({
    required this.id,
    required this.icon,
    required this.name,
    required this.sort,
    required this.code,
    required this.lastUpdate,
    required this.updateAt,
    required this.bankPrices,
    required this.blackMarketPrices,
    required this.liveMarketPrices,
  });

  @override
  List<Object> get props => [
        id,
        icon,
        name,
        sort,
        code,
        lastUpdate,
        updateAt,
      ];
}
