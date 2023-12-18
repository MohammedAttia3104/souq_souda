import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:souq_souda/article/domain/entities/article_data_entity.dart';
import 'package:souq_souda/article/domain/use_cases/get_articles_use_case.dart';
import 'package:souq_souda/core/usecase/base_use_case.dart';

part 'article_state.dart';

class ArticleCubit extends Cubit<ArticleState> {
  final GetArticlesUseCase getArticlesUseCase;

  ArticleCubit(this.getArticlesUseCase) : super(ArticleInitial());

  void getArticlesData() async {
    final result = await getArticlesUseCase(const NoParameters());
    result.fold(
      (l) => emit(ArticleErrorState(l.message)),
      (r) => emit(ArticleSuccessState(r)),
    );
  }
}
