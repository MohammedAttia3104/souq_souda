import 'package:equatable/equatable.dart';

class IngotsAndCoinsCompanyEntity extends Equatable {
  final int id;
  final int companyId;
  final int coinId;
  final double workmanship;
  final double tax;
  final double returnFees;
  final double? price;
  final int ingotId;

  const IngotsAndCoinsCompanyEntity({
    required this.id,
    required this.companyId,
    required this.coinId,
    required this.workmanship,
    required this.tax,
    required this.returnFees,
    required this.ingotId,
    this.price,
  });

  @override
  List<Object?> get props => [
        id,
        companyId,
        coinId,
        workmanship,
        tax,
        returnFees,
        price,
        ingotId,
      ];
}
