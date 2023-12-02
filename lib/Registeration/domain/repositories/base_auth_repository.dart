import 'package:dartz/dartz.dart';
import 'package:souq_souda/Registeration/domain/entities/auth_entity.dart';
import 'package:souq_souda/Registeration/domain/entities/user_entity.dart';
import 'package:souq_souda/Registeration/domain/use_cases/login_use_case.dart';
import 'package:souq_souda/Registeration/domain/use_cases/sign_up_use_case.dart';
import 'package:souq_souda/core/errors/failure.dart';

abstract class BaseAuthRepository {
  Future<Either<Failure, AuthEntity>> loginWithEmailAndPassword(
      LoginParameters parameters);

  Future<Either<Failure, AuthEntity>> signUpEmailAndPassword(
      SignUpParameters parameters);
}
