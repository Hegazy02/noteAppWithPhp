import 'package:flutter/material.dart';
import 'package:noteappwithphp/core/routing/app_router.dart';
import 'package:noteappwithphp/core/routing/routes.dart';
import 'package:noteappwithphp/core/theme/colors.dart';
import 'package:noteappwithphp/features/auth/presentation/views/login_view.dart';

class NoteappwithphpApp extends StatelessWidget {
  const NoteappwithphpApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: MyColors.primaryColor),
        useMaterial3: true,
      ),
      home: const LoginView(),
      initialRoute: Routes.loginView,
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
