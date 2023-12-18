import 'package:souq_souda/article/data/models/article_details_data_model.dart';
import 'package:souq_souda/article/domain/entities/article_details_entity.dart';

class ArticleDetailsModel extends ArticleDetailsEntity {
  const ArticleDetailsModel({
    required super.currentPage,
    required super.data,
    required super.firstPageUrl,
    required super.from,
    required super.nextPageUrl,
    required super.perPage,
    required super.to,
  });

  factory ArticleDetailsModel.fromJson(Map<String, dynamic> json) {
    return ArticleDetailsModel(
      currentPage: json['current_page'],
      data: (json['data'] as List)
          .map((e) => ArticleDetailsDataModel.fromJson(e))
          .toList(),
      firstPageUrl: json['first_page_url'],
      from: json['from'],
      nextPageUrl: json['next_page_url'],
      perPage: json['per_page'],
      to: json['to'],
    );
  }
}
