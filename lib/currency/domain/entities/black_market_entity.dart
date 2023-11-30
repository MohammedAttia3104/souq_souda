import 'package:equatable/equatable.dart';

class BlackMarketEntity extends Equatable {
  final String blackId;
  final String currencyId;
  final String sellPrice;
  final String buyPrice;
  final String hour;
  final String updateAt;
  final String createAt;
  final String date;

  const BlackMarketEntity(
    this.blackId,
    this.sellPrice,
    this.buyPrice,
    this.date,
    this.currencyId,
    this.hour,
    this.updateAt,
    this.createAt,
  );

  @override
  List<Object> get props => [
        blackId,
        currencyId,
        sellPrice,
        buyPrice,
        hour,
        updateAt,
        createAt,
        date,
      ];
}
