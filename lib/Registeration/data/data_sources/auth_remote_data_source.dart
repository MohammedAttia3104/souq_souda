import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:souq_souda/Registeration/domain/entities/auth_entity.dart';
import 'package:souq_souda/Registeration/domain/entities/user_entity.dart';
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
  Future<AuthEntity> loginWithEmailAndPassword(loginParameters) async {
    final response = await Dio().post(
      ApiConstants.loginPath,
      options: Options(
        followRedirects: false,
        maxRedirects: 0,
      ),
      data: {
        "email": loginParameters.email,
        "password": loginParameters.password,
      },
    );
    if (response.statusCode == 200) {
      return (response.data);
    } else if (response.statusCode == 302) {
      String redirectUrl = response.headers['location']![0];
      print('Redirect URL: $redirectUrl');
      Response redirectResponse = await Dio().get(redirectUrl);
      print('Redirect Response: ${redirectResponse.data}');
      return (response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<AuthEntity> signUpWithEmailAndPassword(signUpParameters) async {
    final response = await Dio().post(
      ApiConstants.registerPath,
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
      data: {
        "name": signUpParameters.name,
        "email": signUpParameters.email,
        "password": signUpParameters.password,
        "password_confirmation": signUpParameters.confirmPassword
      },
    );
    debugPrint(response.data);
    if (response.statusCode == 200) {
      return (response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
