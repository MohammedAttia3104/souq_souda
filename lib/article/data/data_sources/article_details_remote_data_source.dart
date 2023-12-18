import 'package:dio/dio.dart';
import 'package:souq_souda/article/domain/entities/article_details_entity.dart';
import 'package:souq_souda/core/errors/exceptions.dart';
import 'package:souq_souda/core/networks/api_constants.dart';
import 'package:souq_souda/core/networks/error_message_model.dart';

abstract class BaseArticleDetailsRemoteDataSource {
  Future<ArticleDetailsEntity> getArticleDetails(int articleId);
}

class ArticleDetailsRemoteDataSource
    extends BaseArticleDetailsRemoteDataSource {
  @override
  Future<ArticleDetailsEntity> getArticleDetails(int articleId) async {
    final response = await Dio().get(
      ApiConstants.articleDetailsPath(
        articleId,
      ),
    );
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel(
          statusMessage: response.data,
        ),
      );
    }
  }
}
///ToDo : Handel ServerExceptionLater "FromBack"/"LocalMessage"