import 'package:dartz/dartz.dart';
import 'package:souq_souda/Registeration/data/data_sources/auth_remote_data_source.dart';
import 'package:souq_souda/Registeration/domain/entities/auth_entity.dart';
import 'package:souq_souda/Registeration/domain/repositories/base_auth_repository.dart';
import 'package:souq_souda/Registeration/domain/use_cases/login_use_case.dart';
import 'package:souq_souda/Registeration/domain/use_cases/sign_up_use_case.dart';
import 'package:souq_souda/core/errors/exceptions.dart';
import 'package:souq_souda/core/errors/failure.dart';

class AuthRepository extends BaseAuthRepository {
  final BaseAuthRemoteDataSource baseAuthRemoteDataSource;

  AuthRepository(this.baseAuthRemoteDataSource);

  @override
  Future<Either<Failure, AuthEntity>> loginWithEmailAndPassword(
      LoginParameters parameters) async {
    final result =
        await baseAuthRemoteDataSource.loginWithEmailAndPassword(parameters);
    try {
      return Right(result);
    } on ServerException catch (f) {
      return Left(ServerFailure(f.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, AuthEntity>> signUpEmailAndPassword(
      SignUpParameters parameters) async {
    final result =
        await baseAuthRemoteDataSource.signUpWithEmailAndPassword(parameters);
    try {
      return Right(result);
    } on ServerException catch (f) {
      return Left(ServerFailure(f.errorMessageModel.statusMessage));
    }
  }
}
