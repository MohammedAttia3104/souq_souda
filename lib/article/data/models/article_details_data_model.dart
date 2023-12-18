import 'package:souq_souda/article/domain/entities/article_details_data_entity.dart';

class ArticleDetailsDataModel extends ArticleDetailsDataEntity {
  const ArticleDetailsDataModel({
    required super.id,
    required super.thumbnail,
    required super.banner,
    required super.title,
    required super.shortDescription,
    required super.description,
    required super.createdAt,
    required super.updateAt,
    required super.readCount,
  });

  factory ArticleDetailsDataModel.fromJson(Map<String, dynamic> json) {
    return ArticleDetailsDataModel(
      id: json["id"],
      thumbnail: json["thumbnail"],
      banner: json["banner"],
      title: json["title"],
      shortDescription: json["short_description"],
      createdAt: json["created_at"],
      description: json["description"],
      updateAt: json["updated_at"],
      readCount: json["reads_count"],
    );
  }
}
