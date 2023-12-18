import 'package:equatable/equatable.dart';

class FavoriteEntity extends Equatable {
  final int id;
  final int userId;
  final int currencyId;
  final int bankId;

  const FavoriteEntity({
    required this.id,
    required this.userId,
    required this.currencyId,
    required this.bankId,
  });

  @override
  List<Object> get props => [
        id,
        userId,
        currencyId,
        bankId,
      ];
}
