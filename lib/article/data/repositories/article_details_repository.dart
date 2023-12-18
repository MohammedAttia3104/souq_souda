import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:souq_souda/article/data/data_sources/article_details_remote_data_source.dart';
import 'package:souq_souda/article/domain/entities/article_details_entity.dart';
import 'package:souq_souda/article/domain/repositories/base_article_details_repository.dart';
import 'package:souq_souda/core/errors/exceptions.dart';
import 'package:souq_souda/core/errors/failure.dart';

class ArticleDetailsRepository extends BaseArticleDetailsRepository {
  final BaseArticleDetailsRemoteDataSource baseArticleDetailsRemoteDataSource;

  ArticleDetailsRepository(this.baseArticleDetailsRemoteDataSource);

  @override
  Future<Either<Failure, ArticleDetailsEntity>> getArticleDetails(
      int articleId) async {
    final result =
        await baseArticleDetailsRemoteDataSource.getArticleDetails(articleId);
    debugPrint(result.toString());
    try {
      return Right(result);
    } on ServerException catch (f) {
      return Left(ServerFailure(f.errorMessageModel.statusMessage));
    }
  }
}
///ToDo : Exceptions Handed Later Locally Or from Server