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

