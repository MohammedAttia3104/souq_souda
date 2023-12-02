import 'package:souq_souda/core/errors/exceptions.dart';
import 'package:souq_souda/core/networks/api_constants.dart';
import 'package:souq_souda/core/networks/error_message_model.dart';
import 'package:souq_souda/currency/data/models/currency_model.dart';
import 'package:souq_souda/currency/domain/entities/currency_entity.dart';
import 'package:dio/dio.dart';

abstract class BaseCurrencyRemoteDataSource {
  Future<List<CurrencyEntity>> getCurrencyDetails();
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
}
