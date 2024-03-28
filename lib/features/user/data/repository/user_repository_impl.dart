import 'dart:io';

import 'package:bloc_ecommerce/core/dto/signin_dto.dart';
import 'package:bloc_ecommerce/core/resources/datastate.dart';
import 'package:bloc_ecommerce/features/user/data/datasources/remote/user_api_service.dart';
import 'package:bloc_ecommerce/features/user/data/models/signin_response_model.dart';
import 'package:bloc_ecommerce/features/user/domain/repositories/user_repository.dart';
import 'package:dio/dio.dart';

class UserRepositoryImpl extends UserRepository {
  final UserApiService _userApiService;
  UserRepositoryImpl(this._userApiService);

  @override
  Future<DataState<SignInResponseModel>> signIn(
      SignInParams signInParams) async {
    try {
      final httpResponse = await _userApiService.signIn(signInParams.toJson());
      if (httpResponse.response.statusCode == HttpStatus.created) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailure(DioException(
          requestOptions: httpResponse.response.requestOptions,
          response: httpResponse.response,
          error: httpResponse.response.statusMessage,
        ));
      }
    } on DioException catch (error) {
      return DataFailure(error);
    }
  }
}
