import 'package:bloc_ecommerce/core/resources/datastate.dart';
import 'package:bloc_ecommerce/core/usecases/usecase.dart';
import 'package:bloc_ecommerce/features/user/data/models/signin_response_model.dart';
import 'package:bloc_ecommerce/features/user/domain/dto/signin_dto.dart';
import 'package:bloc_ecommerce/features/user/domain/repositories/user_repository.dart';

class SignInUsecase
    implements Usecase<DataState<SignInResponseModel>, SignInParams> {
  final UserRepository _userRepository;
  SignInUsecase(this._userRepository);

  @override
  Future<DataState<SignInResponseModel>> call(SignInParams signInParams) {
    return _userRepository.signIn(signInParams);
  }
}
