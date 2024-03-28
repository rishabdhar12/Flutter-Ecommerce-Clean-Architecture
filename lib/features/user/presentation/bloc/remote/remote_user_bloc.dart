import 'package:bloc_ecommerce/core/resources/datastate.dart';
import 'package:bloc_ecommerce/features/user/domain/usecases/signin_usecase.dart';
import 'package:bloc_ecommerce/features/user/presentation/bloc/remote/remote_user_event.dart';
import 'package:bloc_ecommerce/features/user/presentation/bloc/remote/remote_user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RemoteUserBloc extends Bloc<RemoteUserEvent, RemoteUserState> {
  final SignInUsecase _signInUsecase;

  RemoteUserBloc(this._signInUsecase) : super(RemoteUserInitial()) {
    on<SignInUser>(onSignInUser);
    on<CheckUser>(onCheckUser);
  }

  void onSignInUser(SignInUser event, Emitter<RemoteUserState> emit) async {
    final dataState = await _signInUsecase(event.params);

    if (dataState is DataSuccess) {
      emit(RemoteUserDone(dataState.data!));
    }

    if (dataState is DataFailure) {
      emit(RemoteUserError(dataState.error!));
    }
  }

  void onCheckUser(CheckUser event, Emitter<RemoteUserState> emit) async {
    debugPrint("true");
  }
}
