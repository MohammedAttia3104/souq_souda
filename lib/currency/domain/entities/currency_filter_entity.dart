import 'package:equatable/equatable.dart';

class CurrencyFilterEntity extends Equatable {
  final int currencyId;
  final int hour;
  final double price;
  final String date;

  const CurrencyFilterEntity({
    required this.currencyId,
    required this.price,
    required this.date,
    required this.hour,
  });

  @override
  List<Object> get props => [
        currencyId,
        price,
        date,
        hour,
      ];
}
