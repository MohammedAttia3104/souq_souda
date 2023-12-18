part of 'article_details_cubit.dart';

@immutable
abstract class ArticleDetailsState {}

class ArticleDetailsInitial extends ArticleDetailsState {}

class ArticleDetailsLoadingState extends ArticleDetailsState {}

class ArticleDetailsSuccessState extends ArticleDetailsState {
  ArticleDetailsEntity articleDetails;

  ArticleDetailsSuccessState(this.articleDetails);
}

class ArticleDetailsErrorState extends ArticleDetailsState {
  final String error;

  ArticleDetailsErrorState(this.error);
}
