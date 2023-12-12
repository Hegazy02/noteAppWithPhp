import 'package:flutter/material.dart';
import 'package:noteappwithphp/core/routing/app_router.dart';
import 'package:noteappwithphp/core/theme/colors.dart';

class NoteappwithphpApp extends StatelessWidget {
  final String? initialRoute;

  const NoteappwithphpApp({super.key, this.initialRoute});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: MyColors.primaryColor),
        useMaterial3: true,
      ),
      initialRoute: initialRoute,
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
