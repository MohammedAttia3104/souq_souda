import 'package:dartz/dartz.dart';
import 'package:souq_souda/article/domain/entities/article_details_entity.dart';
import 'package:souq_souda/article/domain/repositories/base_article_details_repository.dart';
import 'package:souq_souda/core/errors/failure.dart';

class GetArticleDetailsUseCase {
  final BaseArticleDetailsRepository baseArticleDetailsRepository;

  GetArticleDetailsUseCase(this.baseArticleDetailsRepository);

  Future<Either<Failure, ArticleDetailsEntity>> call(int articleId) async {
    return await baseArticleDetailsRepository.getArticleDetails(articleId);
  }
}
