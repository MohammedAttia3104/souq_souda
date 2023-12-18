import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:souq_souda/article/domain/entities/article_details_entity.dart';
import 'package:souq_souda/article/domain/use_cases/get_article_details_use_case.dart';

part 'article_details_state.dart';

class ArticleDetailsCubit extends Cubit<ArticleDetailsState> {
  final GetArticleDetailsUseCase getArticleDetailsUseCase;

  ArticleDetailsCubit(this.getArticleDetailsUseCase)
      : super(ArticleDetailsInitial());

  void getArticleDetails({required int articleId}) async {
    final result = await getArticleDetailsUseCase(articleId);
    result.fold(
      (l) => emit(ArticleDetailsErrorState(l.message)),
      (r) => emit(ArticleDetailsSuccessState(r)),
    );
  }
}
