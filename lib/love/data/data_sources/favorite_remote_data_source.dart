import 'package:dio/dio.dart';
import 'package:souq_souda/core/errors/exceptions.dart';
import 'package:souq_souda/core/networks/api_constants.dart';
import 'package:souq_souda/core/networks/error_message_model.dart';
import 'package:souq_souda/love/data/models/favorite_model.dart';
import 'package:souq_souda/love/domain/entities/favorite_entity.dart';
import 'package:souq_souda/love/domain/use_cases/add_to_favorite_use_case.dart';

abstract class BaseFavoriteRemoteDataSource {
  Future<FavoriteEntity> addToFavorites(FavoriteParameters parameters);

  Future<FavoriteEntity> removeFromFavorites(FavoriteParameters parameters);
}

class FavoriteRemoteDataSource extends BaseFavoriteRemoteDataSource {
  @override
  Future<FavoriteEntity> addToFavorites(FavoriteParameters parameters) async {
    final response = await Dio().post(
      ApiConstants.addFavoritePath,
      data: parameters.toJson(),
    );
    if (response.statusCode == 200) {
      return FavoriteModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(
          response.data,
        ),
      );
    }
  }

  @override
  Future<FavoriteEntity> removeFromFavorites(
      FavoriteParameters parameters) async {
    final response = await Dio().post(
      ApiConstants.removeFavoritePath,
      data: parameters.toJson(),
    );
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(
          response.data,
        ),
      );
    }
  }
}
