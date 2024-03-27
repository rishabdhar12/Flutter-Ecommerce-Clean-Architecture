import 'package:bloc_ecommerce/core/dependency_injection/injection_container.dart';
import 'package:bloc_ecommerce/features/user/presentation/bloc/remote/remote_user_bloc.dart';
import 'package:bloc_ecommerce/features/user/presentation/bloc/remote/remote_user_event.dart';
import 'package:bloc_ecommerce/features/user/presentation/screens/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteUserBloc>(
      create: (context) => sl()..add(CheckUser()),
      child: MaterialApp(
        title: 'Ecommerce Bloc',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const SignInScreen(),
      ),
    );
  }
}
