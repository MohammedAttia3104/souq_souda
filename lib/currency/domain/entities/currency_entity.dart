import 'package:equatable/equatable.dart';
import 'package:souq_souda/currency/domain/entities/bank_price_entity.dart';
import 'package:souq_souda/currency/domain/entities/black_market_entity.dart';
import 'package:souq_souda/currency/domain/entities/live_market_entity.dart';
import 'package:souq_souda/currency/domain/entities/price_entity.dart';

class CurrencyEntity extends Equatable {
  final int id;
  final String icon;
  final String name;
  final int sort;
  final String code;
  final String lastUpdate;
  final String updateAt;
  final List<PriceEntity> bankPrices;
  final List<PriceEntity> blackMarketPrices;
  final List<PriceEntity> liveMarketPrices;

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
