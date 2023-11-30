import 'package:equatable/equatable.dart';

class PriceEntity extends Equatable {
  final int id;
  final int? bankId;
  final int currencyId;
  final double? buyPrice;
  final double? sellPrice;
  final String date;
  final String createdAt;
  final String updatedAt;
  final int? hour;
  final double? price;

  const PriceEntity({
    required this.id,
    required this.bankId,
    required this.currencyId,
    required this.buyPrice,
    required this.sellPrice,
    required this.date,
    required this.createdAt,
    required this.updatedAt,
    required this.hour,
    required this.price,
  });

  @override
  List<Object> get props => [
        id,
        bankId!,
        currencyId,
        buyPrice!,
        sellPrice!,
        date,
        createdAt,
        updatedAt,
        hour!,
        price!,
      ];
}
