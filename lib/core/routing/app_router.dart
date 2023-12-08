import 'package:flutter/material.dart';
import 'package:noteappwithphp/core/routing/routes.dart';
import 'package:noteappwithphp/features/auth/presentation/views/login_view.dart';
import 'package:noteappwithphp/features/auth/presentation/views/signUp_view.dart';
import 'package:noteappwithphp/features/home/presentation/views/home_view.dart';

class AppRouter {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeView:
        return MaterialPageRoute(builder: (_) => const HomeView());
      case Routes.loginView:
        return MaterialPageRoute(builder: (_) => const LoginView());
      case Routes.signUpview:
        return MaterialPageRoute(builder: (_) => const SignUpView());

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text("No route defined for ${settings.name}"),
                  ),
                ));
    }
  }
}
