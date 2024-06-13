import 'package:dio/dio.dart' as bank_remote_data_source;
import 'package:souq_souda/core/errors/exceptions.dart';
import 'package:souq_souda/core/networks/api_constants.dart';
import 'package:souq_souda/core/networks/error_message_model.dart';
import 'package:souq_souda/currency/data/models/bank_model.dart';
import 'package:souq_souda/currency/domain/entities/bank_entity.dart';

abstract class BaseBankRemoteDataSource {
  Future<List<BankEntity>> getBanks();
}

class BankRemoteDataSource implements BaseBankRemoteDataSource {
  @override
  Future<List<BankEntity>> getBanks() async {
    final response = await bank_remote_data_source.Dio().get(ApiConstants.banksPath);
    if (response.statusCode == 200) {
      return (response.data as List).map((e) => BankModel.fromJson(e)).toList();
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
