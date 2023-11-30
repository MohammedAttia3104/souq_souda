import 'package:equatable/equatable.dart';

class BankEntity extends Equatable {
  final int id;
  final String icon;
  final String name;
  final String shortName;

  const BankEntity({
    required this.id,
    required this.icon,
    required this.name,
    required this.shortName,
  });

  @override
  List<Object> get props => [
        id,
        icon,
        name,
        shortName,
      ];
}
