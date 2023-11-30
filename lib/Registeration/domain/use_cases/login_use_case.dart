import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:souq_souda/Registeration/domain/entities/auth_entity.dart';
import 'package:souq_souda/Registeration/domain/repositories/base_auth_repository.dart';
import 'package:souq_souda/core/errors/failure.dart';
import 'package:souq_souda/core/usecase/base_use_case.dart';

class LoginUseCase extends BaseUseCase<AuthEntity, LoginParameters> {
  final BaseAuthRepository baseAuthRepository;

  LoginUseCase(this.baseAuthRepository);

  @override
  Future<Either<Failure, AuthEntity>> call(LoginParameters parameters) async {
    return await baseAuthRepository.loginWithEmailAndPassword(parameters);
  }
}

class LoginParameters extends Equatable {
  final String email;
  final String password;

  const LoginParameters(this.email, this.password);

  @override
  List<Object> get props => [email, password];
}
