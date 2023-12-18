import 'package:dartz/dartz.dart';
import 'package:souq_souda/article/domain/entities/article_details_entity.dart';
import 'package:souq_souda/core/errors/failure.dart';

abstract class BaseArticleDetailsRepository {
  Future<Either<Failure,ArticleDetailsEntity>> getArticleDetails(int articleId);
}