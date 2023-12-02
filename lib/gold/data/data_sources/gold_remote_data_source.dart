import 'package:dio/dio.dart';
import 'package:souq_souda/core/errors/exceptions.dart';
import 'package:souq_souda/core/networks/api_constants.dart';
import 'package:souq_souda/core/networks/error_message_model.dart';
import 'package:souq_souda/gold/data/models/gold_model.dart';
import 'package:souq_souda/gold/domain/entities/gold_entity.dart';

abstract class BaseGoldRemoteDataSource {
  Future<List<GoldEntity>> getGold();
}

class GoldRemoteDataSource implements BaseGoldRemoteDataSource {
  @override
  Future<List<GoldEntity>> getGold() async {
    final response = await Dio().get(ApiConstants.goldPath);
    if (response.statusCode == 200) {
      return (response.data as List).map((e) => GoldModel.fromJson(e)).toList();
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
