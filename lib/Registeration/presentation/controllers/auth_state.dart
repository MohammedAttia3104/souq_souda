part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthRegisterLoadingState extends AuthState {}

class AuthRegisterSuccessState extends AuthState {
  final UserEntity user;

  AuthRegisterSuccessState(this.user);
}

class AuthRegisterErrorState extends AuthState {
  final String error;

  AuthRegisterErrorState(this.error);
}

class AuthLoginLoadingState extends AuthState {}

class AuthLoginSuccessState extends AuthState {
  final UserEntity user;

  AuthLoginSuccessState(this.user);
}

class AuthLoginErrorState extends AuthState {
  final String error;

  AuthLoginErrorState(this.error);
}
