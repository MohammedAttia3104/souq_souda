import 'package:souq_souda/core/errors/exceptions.dart';
import 'package:souq_souda/core/networks/api_constants.dart';
import 'package:souq_souda/core/networks/error_message_model.dart';
import 'package:souq_souda/currency/data/models/bank_model.dart';
import 'package:souq_souda/currency/data/models/currency_model.dart';
import 'package:souq_souda/currency/domain/entities/bank_entity.dart';
import 'package:souq_souda/currency/domain/entities/currency_entity.dart';
import 'package:dio/dio.dart';

abstract class BaseCurrencyRemoteDataSource {
  Future<List<CurrencyEntity>> getCurrencyDetails();

  Future<List<BankEntity>> getBanks();

}

class CurrencyRemoteDataSource implements BaseCurrencyRemoteDataSource {
  @override
  Future<List<CurrencyEntity>> getCurrencyDetails() async {
    final response = await Dio().get(ApiConstants.currencyPath);
    if (response.statusCode == 200) {
      return (response.data as List)
          .map((e) => CurrencyModel.fromJson(e))
          .toList();
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<BankEntity>> getBanks() async {
    final response = await Dio().get(ApiConstants.banksPath);
    if (response.statusCode == 200) {
      return (response.data as List).map((e) => BankModel.fromJson(e)).toList();
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
