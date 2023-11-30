import 'package:equatable/equatable.dart';

class LiveMarketEntity extends Equatable {
  final String liveId;
  final String currencyId;
  final String price;
  final String hour;
  final String updateAt;
  final String createAt;
  final String date;

  const LiveMarketEntity(
    this.liveId,
    this.currencyId,
    this.price,
    this.hour,
    this.updateAt,
    this.createAt,
    this.date,
  );

  @override
  List<Object> get props => [
        liveId,
        currencyId,
        price,
        hour,
        updateAt,
        createAt,
        date,
      ];
}
