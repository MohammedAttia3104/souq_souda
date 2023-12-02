import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final int? id;
  final String name;
  final String email;
  String? password;
  String? confirmPassword;

  UserEntity({
    this.id,
    required this.name,
    required this.email,
    this.password,
    this.confirmPassword,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        email,
        password,
        confirmPassword,
      ];
}
