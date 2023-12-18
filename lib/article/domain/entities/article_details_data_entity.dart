import 'package:equatable/equatable.dart';

class ArticleDetailsDataEntity extends Equatable {
  final int id;
  final String thumbnail;
  final String banner;
  final String title;
  final String shortDescription;
  final String description;
  final String createdAt;
  final String updateAt;
  final int readCount;

  const ArticleDetailsDataEntity({
    required this.id,
    required this.thumbnail,
    required this.banner,
    required this.title,
    required this.shortDescription,
    required this.description,
    required this.createdAt,
    required this.updateAt,
    required this.readCount,
  });

  @override
  List<Object> get props =>
      [
        id,
        thumbnail,
        banner,
        title,
        shortDescription,
        description,
        createdAt,
        updateAt,
        readCount,
      ];
}
// {
// "id": 10,
// "thumbnail": "articles/July2023/DGPrk34pFvtQ9AEZNe9G.jpg",
// "banner": "articles/July2023/Eh3EPR9hZAh9m0KvESm7.jpg",
// "title": "مع تطور العلاقات بين مصر وتركيا كيف كان الإستثمار والتجارة بين البلدين ؟",
// "short_description": "‏‎مصر و ‎تركيا تعيدان العلاقة الى مستوى السفراء بعد 10 سنوات.. تعرف على حجم التبادل التجاري بين البلدين",
// "description": "<p style=\"text-align: center;\"><strong>&rlm;&lrm;مصر و &lrm;تركيا تعيدان العلاقة الى مستوى السفراء بعد 10 سنوات من القطيعة بين البلدين .. تعرف على حجم التبادل التجاري بين البلدين</strong></p>\r\n<p>&nbsp;</p>\r\n<p><strong><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"https://therealcurrencymarket.app/storage/articles/July2023/20230704_214451.jpg\" alt=\"\" width=\"350\" height=\"350\"></strong></p>",
// "draft": 0,
// "created_at": "2023-07-04 21:49:55",
// "updated_at": "2023-07-04 21:56:28",
// "comments": [],
// "reads_count": 837
// }
