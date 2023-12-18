import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:souq_souda/core/errors/exceptions.dart';
import 'package:souq_souda/core/networks/api_constants.dart';
import 'package:souq_souda/core/networks/error_message_model.dart';
import 'package:souq_souda/currency/data/models/currency_filter_model.dart';
import 'package:souq_souda/currency/domain/entities/currency_filter_entity.dart';
import 'package:souq_souda/currency/domain/use_cases/draw_live_currency_chart_use_case.dart';

abstract class BaseCurrencyFilterRemoteDataSource {
  Future<List<CurrencyFilterEntity>> drawLiveCurrencyChart(
    ChartParameters parameters,
  );

  Future<List<CurrencyFilterEntity>> drawBlackCurrencyChart(
    ChartParameters parameters,
  );
}

class CurrencyFilterRemoteDataSource
    extends BaseCurrencyFilterRemoteDataSource {
  @override
  Future<List<CurrencyFilterEntity>> drawBlackCurrencyChart(
    ChartParameters parameters,
  ) async {
    final response = await Dio().get(
      ApiConstants.currencyFilterWithTypeAndDate(
        type: parameters.type,
        currencyId: parameters.currencyId,
        dateTime: parameters.date,
      ),
    );
    debugPrint(response.toString());
    if (response.statusCode == 200) {
      return (response.data["black_market_prices"]["${parameters.currencyId}"])
          .map((e) => CurrencyFilterModel.fromJson(e))
          .toList();
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<CurrencyFilterEntity>> drawLiveCurrencyChart(
    ChartParameters parameters,
  ) async {
    final response = await Dio().get(
      ApiConstants.currencyFilterWithTypeAndDate(
        type: parameters.type,
        currencyId: parameters.currencyId,
        dateTime: parameters.date,
      ),
    );
    if (response.statusCode == 200) {
      return (response.data["live_prices"]["${parameters.currencyId}"] as List)
          .map((e) => CurrencyFilterModel.fromJson(e))
          .toList();
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
