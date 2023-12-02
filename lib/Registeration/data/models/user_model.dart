import 'package:souq_souda/Registeration/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    super.id,
    required super.name,
    required super.email,
    super.password,
    super.confirmPassword,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['password'] = password;
    data['password_confirmation'] = confirmPassword;
    return data;
  }
}
