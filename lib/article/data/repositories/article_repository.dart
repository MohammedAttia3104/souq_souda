import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:souq_souda/article/data/data_sources/article_remote_data_source.dart';
import 'package:souq_souda/article/domain/entities/article_data_entity.dart';
import 'package:souq_souda/article/domain/repositories/base_article_repository.dart';
import 'package:souq_souda/core/errors/exceptions.dart';
import 'package:souq_souda/core/errors/failure.dart';

class ArticleRepository extends BaseArticleRepository {
  final BaseArticleRemoteDataSource baseArticleRemoteDataSource;

  ArticleRepository(this.baseArticleRemoteDataSource);

  @override
  Future<Either<Failure, List<ArticleDataEntity>>> getArticlesData() async {
    final result = await baseArticleRemoteDataSource.getArticleData();
    debugPrint(result.toString());
    try {
      return Right(result);
    } on ServerException catch (f) {
      return Left(ServerFailure(f.errorMessageModel.statusMessage));
    }
  }
}
