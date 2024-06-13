import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:souq_souda/core/errors/exceptions.dart';
import 'package:souq_souda/core/errors/failure.dart';
import 'package:souq_souda/currency/data/data_sources/currency_remote_filter_use_case.dart';
import 'package:souq_souda/currency/domain/entities/currency_filter_entity.dart';
import 'package:souq_souda/currency/domain/repositories/base_currency_filter_repository.dart';
import 'package:souq_souda/currency/domain/use_cases/draw_live_currency_chart_use_case.dart';

class CurrencyFilterRepository extends BaseCurrencyFilterRepository {
  final BaseCurrencyFilterRemoteDataSource baseCurrencyFilterRemoteDataSource;

  CurrencyFilterRepository(this.baseCurrencyFilterRemoteDataSource);

  @override
  Future<Either<Failure, List<CurrencyFilterEntity>>> drawLiveCurrencyChart(
    ChartParameters parameters,
  ) async {
    final result = await baseCurrencyFilterRemoteDataSource
        .drawLiveCurrencyChart(parameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<CurrencyFilterEntity>>> drawBlackCurrencyChart(
    ChartParameters parameters,
  ) async {
    final result = await baseCurrencyFilterRemoteDataSource
        .drawBlackCurrencyChart(parameters);
    debugPrint(result as String?);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
}
