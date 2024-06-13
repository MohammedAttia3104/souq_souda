import 'package:dartz/dartz.dart';
import 'package:souq_souda/article/domain/entities/article_data_entity.dart';
import 'package:souq_souda/core/errors/failure.dart';

abstract class BaseArticleRepository {
  Future<Either<Failure,List<ArticleDataEntity>>> getArticlesData();
}