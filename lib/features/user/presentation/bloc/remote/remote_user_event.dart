import 'package:bloc_ecommerce/core/dto/signin_dto.dart';

abstract class RemoteUserEvent {
  const RemoteUserEvent();
}

class SignInUser extends RemoteUserEvent {
  final SignInParams params;
  SignInUser(this.params);
}

class CheckUser extends RemoteUserEvent {}
