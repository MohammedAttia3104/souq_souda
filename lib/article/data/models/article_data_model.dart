import 'package:souq_souda/article/domain/entities/article_data_entity.dart';

class ArticleDataModel extends ArticleDataEntity {
  const ArticleDataModel({
    required super.id,
    required super.thumbnail,
    required super.banner,
    required super.title,
    required super.shortDescription,
    required super.createdAt,
  });

  factory ArticleDataModel.fromJson(Map<String, dynamic> json) {
    return ArticleDataModel(
      id: json["id"],
      thumbnail: json["thumbnail"],
      banner: json["banner"],
      title: json["title"],
      shortDescription: json["short_description"],
      createdAt: json["created_at"],
    );
  }
}
