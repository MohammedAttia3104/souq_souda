part of 'gold_cubit.dart';

@immutable
abstract class GoldState {}

class GoldInitial extends GoldState {}

class GoldLoadingState extends GoldState {}

class GoldSuccessState extends GoldState {
  List<GoldEntity> golds = [];

  GoldSuccessState(this.golds);
}

class GoldErrorState extends GoldState {
  final String error;

  GoldErrorState(this.error);
}
