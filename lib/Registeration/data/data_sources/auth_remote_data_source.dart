
import 'package:dio/dio.dart';
import 'package:souq_souda/Registeration/data/models/auth_model.dart';
import 'package:souq_souda/Registeration/domain/entities/auth_entity.dart';
import 'package:souq_souda/Registeration/domain/use_cases/login_use_case.dart';
import 'package:souq_souda/Registeration/domain/use_cases/sign_up_use_case.dart';
import 'package:souq_souda/core/errors/exceptions.dart';
import 'package:souq_souda/core/networks/api_constants.dart';
import 'package:souq_souda/core/networks/error_message_model.dart';

abstract class BaseAuthRemoteDataSource {
  Future<AuthEntity> loginWithEmailAndPassword(LoginParameters loginParameters);

  Future<AuthEntity> signUpWithEmailAndPassword(
      SignUpParameters signUpParameters);
}

class AuthRemoteDataSource implements BaseAuthRemoteDataSource {
  @override
  Future<AuthEntity> loginWithEmailAndPassword(
      LoginParameters loginParameters) async {
    final response = await Dio().post(
      ApiConstants.loginPath,
      data: loginParameters.toJson(),
    );
    if (response.statusCode == 200) {
      return AuthModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<AuthEntity> signUpWithEmailAndPassword(
      SignUpParameters signUpParameters) async {
    final response = await Dio().post(
      ApiConstants.registerPath,
      data: signUpParameters.toJson(),
    );
    if (response.statusCode == 200) {
      return AuthModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
