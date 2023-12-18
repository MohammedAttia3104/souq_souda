import 'package:dio/dio.dart';
import 'package:souq_souda/article/data/models/article_data_model.dart';
import 'package:souq_souda/article/domain/entities/article_data_entity.dart';
import 'package:souq_souda/core/errors/exceptions.dart';
import 'package:souq_souda/core/networks/api_constants.dart';
import 'package:souq_souda/core/networks/error_message_model.dart';

abstract class BaseArticleRemoteDataSource {
  Future<List<ArticleDataEntity>> getArticleData();
}

class ArticleRemoteDataSource extends BaseArticleRemoteDataSource {
  @override
  Future<List<ArticleDataEntity>> getArticleData() async {
    final response = await Dio().get(ApiConstants.articlesPath);
    if (response.statusCode == 200) {
      return (response.data['data'] as List)
          .map((e) => ArticleDataModel.fromJson(e))
          .toList();
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
