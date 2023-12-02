import 'package:souq_souda/Registeration/data/models/user_model.dart';
import 'package:souq_souda/Registeration/domain/entities/auth_entity.dart';

class AuthModel extends AuthEntity {
  const AuthModel({
    required super.user,
    required super.token,
    required super.expiresAt,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      user: UserModel.fromJson(json['user']),
      token: json['access_token'],
      expiresAt: json['expires_at'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['access_token'] = token;
    data['expires_at'] = expiresAt;
    data['user'] = user;
    return data;
  }
}
