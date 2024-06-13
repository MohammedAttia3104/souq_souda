import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'bank_entity.g.dart';
@HiveType(typeId: 0)
class BankEntity extends Equatable {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String icon;
  @HiveField(2)
  final String name;
  @HiveField(3)
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
