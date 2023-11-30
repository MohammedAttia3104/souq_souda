part of 'currency_details_cubit.dart';

@immutable
abstract class CurrencyDetailsState {}

class CurrencyDetailsInitial extends CurrencyDetailsState {}

class CurrencyDetailsLoadingState extends CurrencyDetailsState {}

class CurrencyDetailsSuccessState extends CurrencyDetailsState {
  List<CurrencyEntity> currencies = [];

  CurrencyDetailsSuccessState(this.currencies);
}

class CurrencyDetailsErrorState extends CurrencyDetailsState {
  final String error;

  CurrencyDetailsErrorState({required this.error});
}

class BanksLoadingState extends CurrencyDetailsState {}

class BanksSuccessState extends CurrencyDetailsState {
  List<BankEntity> banks = [];

  BanksSuccessState(this.banks);
}

class BanksErrorState extends CurrencyDetailsState {
  final String error;

  BanksErrorState({required this.error});
}
