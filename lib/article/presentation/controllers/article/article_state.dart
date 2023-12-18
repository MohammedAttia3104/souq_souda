part of 'article_cubit.dart';

@immutable
abstract class ArticleState {}

class ArticleInitial extends ArticleState {}

class ArticleLoadingState extends ArticleState {}

class ArticleSuccessState extends ArticleState {
  List<ArticleDataEntity> articles = [];

  ArticleSuccessState(this.articles);
}

class ArticleErrorState extends ArticleState {
  final String error;

  ArticleErrorState(this.error);
}
