import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:souq_souda/Registeration/domain/entities/auth_entity.dart';
import 'package:souq_souda/Registeration/domain/use_cases/login_use_case.dart';
import 'package:souq_souda/Registeration/domain/use_cases/sign_up_use_case.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final LoginUseCase loginUseCase;
  final SignUpUseCase signUpUseCase;

  AuthCubit(
    this.loginUseCase,
    this.signUpUseCase,
  ) : super(AuthInitial());

  static AuthCubit get(context) => BlocProvider.of(context);

  void getAuthLogin({
    required String email,
    required String password,
  }) async {
    emit(AuthLoginLoadingState());
    final result = await loginUseCase(
      LoginParameters(
        email: email,
        password: password,
      ),
    );
    result.fold(
      (l) => emit(AuthLoginErrorState(l.message)),
      (r) => emit(AuthLoginSuccessState(r)),
    );
  }

  void getAuthRegister({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    emit(AuthRegisterLoadingState());
    final result = await signUpUseCase(
      SignUpParameters(
        name: name,
        email: email,
        password: password,
        confirmPassword: confirmPassword,
      ),
    );
    result.fold(
      (l) => emit(AuthRegisterErrorState(l.message)),
      (r) => emit(AuthRegisterSuccessState(r)),
    );
  }
}
