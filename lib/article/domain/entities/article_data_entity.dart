import 'package:equatable/equatable.dart';

class ArticleDataEntity extends Equatable {
  final int id;
  final String thumbnail;
  final String banner;
  final String title;
  final String shortDescription;
  final String createdAt;

  const ArticleDataEntity({
    required this.id,
    required this.thumbnail,
    required this.banner,
    required this.title,
    required this.shortDescription,
    required this.createdAt,
  });

  @override
  List<Object> get props => [
        id,
        thumbnail,
        banner,
        title,
        shortDescription,
        createdAt,
      ];
}
