import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteappwithphp/core/helpers/extentions.dart';
import 'package:noteappwithphp/core/routing/routes.dart';
import 'package:noteappwithphp/features/home/presentation/view_model/home/home_cubit.dart';
import 'package:noteappwithphp/features/home/presentation/views/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.pushNamed(Routes.addNoteView);
          },
          child: const Icon(Icons.add),
        ),
        body: SafeArea(
            child: BlocProvider(
          create: (context) => HomeCubit()..getUserData(),
          child: const HomeViewBody(),
        )));
  }
}
