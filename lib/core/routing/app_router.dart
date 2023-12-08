import 'package:flutter/material.dart';
import 'package:noteappwithphp/core/models/note_model.dart';
import 'package:noteappwithphp/core/routing/routes.dart';
import 'package:noteappwithphp/features/add_note/presentation/views/add_note_view.dart';
import 'package:noteappwithphp/features/auth/presentation/views/login_view.dart';
import 'package:noteappwithphp/features/auth/presentation/views/signUp_view.dart';
import 'package:noteappwithphp/features/edit_note/presentation/views/edit_note_view.dart';
import 'package:noteappwithphp/features/home/presentation/views/home_view.dart';

class AppRouter {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeView:
        return MaterialPageRoute(builder: (_) => const HomeView());
      case Routes.loginView:
        return MaterialPageRoute(builder: (_) => const LoginView());
      case Routes.signUpView:
        return MaterialPageRoute(builder: (_) => const SignUpView());
      case Routes.addNoteView:
        return MaterialPageRoute(builder: (_) => const AddNoteView());
      case Routes.editNoteView:
        return MaterialPageRoute(
            builder: (_) =>
                EditNoteView(noteModel: settings.arguments as NoteModel));

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
