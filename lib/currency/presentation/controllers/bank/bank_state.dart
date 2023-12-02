part of 'bank_cubit.dart';

@immutable
abstract class BankState {}

class BankInitial extends BankState {}

class BanksLoadingState extends BankState {}

class BanksSuccessState extends BankState {
  List<BankEntity> banks = [];

  BanksSuccessState(this.banks);
}

class BanksErrorState extends BankState {
  final String error;

  BanksErrorState({required this.error});
}

class CentralBankOfEgyptChangedColorState extends BankState {}