part of 'ingots_and_coins_cubit.dart';

@immutable
abstract class IngotsAndCoinsState {}

class IngotsAndCoinsInitial extends IngotsAndCoinsState {}

class IngotsLoadingState extends IngotsAndCoinsState {}

class IngotsSuccessState extends IngotsAndCoinsState {
  List<IngotsAndCoinsEntity> ingots = [];

  IngotsSuccessState(this.ingots);
}

class IngotsErrorState extends IngotsAndCoinsState {
  final String error;

  IngotsErrorState(this.error);
}

class CoinsLoadingState extends IngotsAndCoinsState {}

class CoinsSuccessState extends IngotsAndCoinsState {
  List<IngotsAndCoinsEntity> coins = [];

  CoinsSuccessState(this.coins);
}

class CoinsErrorState extends IngotsAndCoinsState {
  final String error;

  CoinsErrorState(this.error);
}
