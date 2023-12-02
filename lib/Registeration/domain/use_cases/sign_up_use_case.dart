import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:souq_souda/Registeration/domain/entities/auth_entity.dart';
import 'package:souq_souda/Registeration/domain/entities/user_entity.dart';
import 'package:souq_souda/Registeration/domain/repositories/base_auth_repository.dart';
import 'package:souq_souda/core/errors/failure.dart';
import 'package:souq_souda/core/usecase/base_use_case.dart';

class SignUpUseCase extends BaseUseCase<AuthEntity, SignUpParameters> {
  final BaseAuthRepository baseAuthRepository;

  SignUpUseCase(this.baseAuthRepository);

  @override
  Future<Either<Failure, AuthEntity>> call(SignUpParameters parameters) async {
    return await baseAuthRepository.signUpEmailAndPassword(parameters);
  }
}

class SignUpParameters extends Equatable {
  final String name;
  final String email;
  final String password;
  final String confirmPassword;

  const SignUpParameters(
    this.name,
    this.email,
    this.password,
    this.confirmPassword,
  );

  @override
  List<Object?> get props => [
        name,
        email,
        password,
        confirmPassword,
      ];
}
