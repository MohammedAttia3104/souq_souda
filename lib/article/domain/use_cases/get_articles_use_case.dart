import 'package:dartz/dartz.dart';
import 'package:souq_souda/article/domain/entities/article_data_entity.dart';
import 'package:souq_souda/article/domain/repositories/base_article_repository.dart';
import 'package:souq_souda/core/errors/failure.dart';
import 'package:souq_souda/core/usecase/base_use_case.dart';

class GetArticlesUseCase
    extends BaseUseCase<List<ArticleDataEntity>, NoParameters> {
  final BaseArticleRepository baseArticleRepository;

  GetArticlesUseCase(this.baseArticleRepository);

  @override
  Future<Either<Failure, List<ArticleDataEntity>>> call(
      NoParameters parameters) async {
    return await baseArticleRepository.getArticlesData();
  }
}
