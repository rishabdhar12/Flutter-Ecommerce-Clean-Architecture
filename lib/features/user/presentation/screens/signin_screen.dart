import 'package:bloc_ecommerce/core/dto/signin_dto.dart';
import 'package:bloc_ecommerce/features/user/presentation/bloc/remote/remote_user_bloc.dart';
import 'package:bloc_ecommerce/features/user/presentation/bloc/remote/remote_user_event.dart';
import 'package:bloc_ecommerce/features/user/presentation/bloc/remote/remote_user_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controllers when the Widget is disposed
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _signIn() {
    String email = _emailController.text;
    String password = _passwordController.text;

    context.read<RemoteUserBloc>().add(SignInUser(SignInParams(
          email: _emailController.text,
          password: _passwordController.text,
        )));

    // For demonstration purposes, just clear the fields
    _emailController.clear();
    _passwordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
      ),
      body: BlocBuilder<RemoteUserBloc, RemoteUserState>(
        builder: (context, state) {
          if (state is RemoteUserLoading) {
            return const Center(child: CupertinoActivityIndicator());
          }
          if (state is RemoteUserError) {
            return const Center(child: Icon(Icons.refresh));
          }
          if (state is RemoteUserDone) {
            debugPrint("User login");
          }
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16.0),
                TextField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: _signIn,
                  child: const Text('Sign In'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
