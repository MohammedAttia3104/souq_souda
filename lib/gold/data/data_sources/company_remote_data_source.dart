import 'package:dio/dio.dart';
import 'package:souq_souda/core/errors/exceptions.dart';
import 'package:souq_souda/core/networks/api_constants.dart';
import 'package:souq_souda/core/networks/error_message_model.dart';
import 'package:souq_souda/gold/data/models/company_model.dart';
import 'package:souq_souda/gold/domain/entities/company_entity.dart';

abstract class BaseCompanyRemoteDataSource {
  Future<List<CompanyEntity>> getCompanies();
}

class CompanyRemoteDataSource implements BaseCompanyRemoteDataSource {
  @override
  Future<List<CompanyEntity>> getCompanies() async {
    final response = await Dio().get(ApiConstants.companiesPath);
    if (response.statusCode == 200) {
      return (response.data as List)
          .map((e) => CompanyModel.fromJson(e))
          .toList();
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
