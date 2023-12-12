import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteappwithphp/features/auth/presentation/view_model/auth/auth_cubit.dart';
import 'package:noteappwithphp/features/auth/presentation/views/widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: BlocProvider(
      create: (context) => AuthCubit(),
      child: const LoginViewBody(),
    )));
  }
}
