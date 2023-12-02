import 'package:dio/dio.dart';
import 'package:souq_souda/core/errors/exceptions.dart';
import 'package:souq_souda/core/networks/api_constants.dart';
import 'package:souq_souda/core/networks/error_message_model.dart';
import 'package:souq_souda/gold/data/models/ingots_and_coins_model.dart';
import 'package:souq_souda/gold/domain/entities/ingots_and_coins_entity.dart';

abstract class BaseIngotsAndCoinsRemoteDataSource {
  Future<List<IngotsAndCoinsEntity>> getIngotsAndCoins();
}

class IngotsAndCoinsRemoteDataSource
    implements BaseIngotsAndCoinsRemoteDataSource {
  @override
  Future<List<IngotsAndCoinsEntity>> getIngotsAndCoins() async {
    final response = await Dio().get(ApiConstants.ingotsAndCoinsPath);
    if (response.statusCode == 200) {
      return (response.data as List)
          .map((e) => IngotsAndCoinsModel.fromJson(e))
          .toList();
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
