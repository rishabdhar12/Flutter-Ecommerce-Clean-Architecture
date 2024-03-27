import 'package:bloc_ecommerce/core/resources/datastate.dart';
import 'package:bloc_ecommerce/features/user/data/models/signin_response_model.dart';
import 'package:bloc_ecommerce/features/user/domain/dto/signin_dto.dart';

abstract class UserRepository {
  Future<DataState<SignInResponseModel>> signIn(SignInParams signInParams);
}
