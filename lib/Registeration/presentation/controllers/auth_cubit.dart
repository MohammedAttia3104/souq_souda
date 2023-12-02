import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
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

  void getAuthLogin(UserEntity user) async {
    emit(AuthLoginLoadingState());
    final result = await loginUseCase(LoginParameters(
      user.email,
      user.password.toString(),
    ));
    result.fold(
      (l) => emit(AuthLoginErrorState(l.message)),
      (r) => emit(AuthLoginSuccessState(r)),
    );
  }

  void getAuthRegister(UserEntity user) async {
    emit(AuthLoginLoadingState());
    final result = await signUpUseCase(
      SignUpParameters(
        user.name,
        user.email,
        user.password.toString(),
        user.confirmPassword.toString(),
      ),
    );
    result.fold(
      (l) => emit(AuthLoginErrorState(l.message)),
      (r) => emit(AuthLoginSuccessState(r)),
    );
  }
}
