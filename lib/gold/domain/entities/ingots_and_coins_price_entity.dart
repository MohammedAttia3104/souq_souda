import 'package:equatable/equatable.dart';

class IngotsAndCoinsPriceEntity extends Equatable {
  final int id;
  final int? goldCoinId;
  final int? goldIngotId;

  final double buyPrice;
  final double sellPrice;

  const IngotsAndCoinsPriceEntity({
    required this.id,
    required this.goldCoinId,
    required this.goldIngotId,
    required this.buyPrice,
    required this.sellPrice,
  });

  @override
  List<Object> get props => [
        id,
        goldCoinId!,
        goldIngotId!,
        buyPrice,
        sellPrice,
      ];
}
