import 'package:equatable/equatable.dart';

class GoldPriceEntity extends Equatable {
  final double price;
  final double buyPrice;

  const GoldPriceEntity({
    required this.price,
    required this.buyPrice,
  });

  @override
  List<Object> get props => [price, buyPrice,];
}
