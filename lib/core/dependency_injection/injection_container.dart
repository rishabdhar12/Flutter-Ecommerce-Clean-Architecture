import 'package:bloc_ecommerce/features/user/data/datasources/remote/user_api_service.dart';
import 'package:bloc_ecommerce/features/user/data/repository/user_repository_impl.dart';
import 'package:bloc_ecommerce/features/user/domain/repositories/user_repository.dart';
import 'package:bloc_ecommerce/features/user/domain/usecases/signin_usecase.dart';
import 'package:bloc_ecommerce/features/user/presentation/bloc/remote/remote_user_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.asNewInstance();

Future<void> initializeDependencies() async {
  // Dio
  sl.registerSingleton<Dio>(Dio());

  // Dependencies
  sl.registerSingleton<UserApiService>(UserApiService(sl()));

  sl.registerSingleton<UserRepository>(UserRepositoryImpl(sl()));

  // Usecase
  sl.registerSingleton<SignInUsecase>(SignInUsecase(sl()));

  // Blocs
  sl.registerFactory<RemoteUserBloc>(() => RemoteUserBloc(sl()));
}
