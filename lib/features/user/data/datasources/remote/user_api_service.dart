import 'package:bloc_ecommerce/core/constants/constants.dart';
import 'package:bloc_ecommerce/features/user/data/models/signin_response_model.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';

part "user_api_service.g.dart";

@RestApi(baseUrl: baseUrl)
abstract class UserApiService {
  factory UserApiService(Dio dio) = _UserApiService;

  @POST('/auth/login')
  @Headers(<String, dynamic>{
    'Content-Type': 'application/json',
  })
  Future<HttpResponse<SignInResponseModel>> signIn(
      @Body() Map<String, dynamic> signInParams);
}
