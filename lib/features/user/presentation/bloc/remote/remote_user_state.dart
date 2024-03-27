import 'package:bloc_ecommerce/features/user/data/models/signin_response_model.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

abstract class RemoteUserState extends Equatable {
  final SignInResponseModel? signInResponseModel;
  final DioException? exception;

  const RemoteUserState({this.signInResponseModel, this.exception});

  @override
  List<Object> get props => [signInResponseModel!, exception!];
}

class RemoteUserInitial extends RemoteUserState {
  @override
  List<Object> get props => [];
}

class RemoteUserLoading extends RemoteUserState {
  const RemoteUserLoading();
}

class RemoteUserDone extends RemoteUserState {
  const RemoteUserDone(SignInResponseModel signInResponseModel)
      : super(signInResponseModel: signInResponseModel);
}

class RemoteUserError extends RemoteUserState {
  const RemoteUserError(DioException exception) : super(exception: exception);
}
