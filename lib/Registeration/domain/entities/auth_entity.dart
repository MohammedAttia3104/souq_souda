import 'package:equatable/equatable.dart';
import 'package:souq_souda/Registeration/domain/entities/user_entity.dart';

class AuthEntity extends Equatable {
  final UserEntity user;
  final String token;
  final String expiresAt;

  const AuthEntity({
    required this.user,
    required this.token,
    required this.expiresAt,
  });

  @override
  List<Object> get props => [
        user,
        token,
        expiresAt,
      ];
}
