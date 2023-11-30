import 'package:souq_souda/Registeration/domain/entities/auth_entity.dart';

abstract class BaseAuthRemoteDataSource{
  Future<AuthEntity> loginWithEmailAndPassword();
  Future<AuthEntity> signUpWithEmailAndPassword();
}

class AuthRemoteDataSource implements BaseAuthRemoteDataSource{
  @override
  Future<AuthEntity> loginWithEmailAndPassword() {
    // TODO: implement loginWithEmailAndPassword
    throw UnimplementedError();
  }

  @override
  Future<AuthEntity> signUpWithEmailAndPassword() {
    // TODO: implement signUpWithEmailAndPassword
    throw UnimplementedError();
  }
}