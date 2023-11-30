import 'package:equatable/equatable.dart';

class BankPriceEntity extends Equatable {
  final String id;
  final String bankId;
  final String currencyId;
  final String sellPrice;
  final String buyPrice;
  final String updateAt;
  final String createAt;
  final String date;

  const BankPriceEntity(
    this.id,
    this.bankId,
    this.currencyId,
    this.sellPrice,
    this.buyPrice,
    this.updateAt,
    this.createAt,
    this.date,
  );

  @override
  List<Object> get props => [
        id,
        bankId,
        currencyId,
        sellPrice,
        buyPrice,
        updateAt,
        createAt,
        date,
      ];
}
