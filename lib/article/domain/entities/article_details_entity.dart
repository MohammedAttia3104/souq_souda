import 'package:equatable/equatable.dart';
import 'package:souq_souda/article/domain/entities/article_details_data_entity.dart';

class ArticleDetailsEntity extends Equatable {
  final int currentPage;
  final List<ArticleDetailsDataEntity> data;
  final String firstPageUrl;
  final int from;
  final String nextPageUrl;
  final int perPage;
  final int to;

  const ArticleDetailsEntity({
    required this.currentPage,
    required this.data,
    required this.firstPageUrl,
    required this.from,
    required this.nextPageUrl,
    required this.perPage,
    required this.to,
  });

  @override
  List<Object> get props => [
        currentPage,
        data,
        firstPageUrl,
        from,
        nextPageUrl,
        perPage,
        to,
      ];
}
