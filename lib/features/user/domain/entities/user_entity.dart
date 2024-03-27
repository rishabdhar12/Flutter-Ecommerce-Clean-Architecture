import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final int? id;
  final String? email;
  final String? password;
  final String? role;
  final String? avatar;

  const UserEntity({
    this.id,
    this.email,
    this.password,
    this.role,
    this.avatar,
  });

  @override
  List<Object?> get props => [
    id,
    email,
    role,
    avatar,
  ];
}
