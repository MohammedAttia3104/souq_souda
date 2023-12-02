import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:souq_souda/Registeration/data/models/auth_model.dart';
import 'package:souq_souda/Registeration/domain/entities/auth_entity.dart';
import 'package:souq_souda/Registeration/domain/entities/user_entity.dart';
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

  void getAuthLogin({
    required String email,
    required String password,
  }) async {
    emit(AuthLoginLoadingState());
    final result = await loginUseCase(LoginParameters(
      email,
      password,
    ));
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
    emit(AuthLoginLoadingState());
    final result = await signUpUseCase(
      SignUpParameters(
        name,
        email,
        password,
        confirmPassword,
      ),
    );
    result.fold(
      (l) => emit(AuthLoginErrorState(l.message)),
      (r) => emit(AuthLoginSuccessState(r)),
    );
  }
}
