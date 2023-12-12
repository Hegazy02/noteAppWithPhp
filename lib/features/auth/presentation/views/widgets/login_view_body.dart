import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteappwithphp/core/helpers/extentions.dart';
import 'package:noteappwithphp/core/routing/routes.dart';
import 'package:noteappwithphp/core/theme/styles.dart';
import 'package:noteappwithphp/core/utils/sqlflite.dart';
import 'package:noteappwithphp/core/widgets/custom_button.dart';
import 'package:noteappwithphp/core/widgets/cutom_textFormField.dart';
import 'package:noteappwithphp/features/auth/presentation/view_model/auth/auth_cubit.dart';
import 'package:noteappwithphp/features/auth/presentation/view_model/auth/auth_state.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            Image.asset(
              "assets/images/note logo.png",
              scale: 3,
            ),
            CustomTextFormField(
              controller: email,
              hint: "Email",
            ),
            CustomTextFormField(
              controller: password,
              hint: "Password",
            ),
            const SizedBox(
              height: 30,
            ),
            CustomButton(
              text: "Login",
              onPressed: () async {
                await BlocProvider.of<AuthCubit>(context).login(
                    email: email.text,
                    password: password.text,
                    context: context);
              },
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const Text("You don't have an account?"),
                BlocListener<AuthCubit, AuthState>(
                  listener: (context, state) async {
                    if (state is AuthSuccess) {
                      await SqlDb().updatetData(
                          "UPDATE `user` SET isLogined = 1,`username` = '${state.userData['username']}',`email` = '${state.userData['email']}',`password` = '${state.userData['password']}'");
                      context.pushNamedAndRemoveUntil(
                        Routes.homeView,
                        predicate: (route) => false,
                      );
                    }
                  },
                  child: TextButton(
                      onPressed: () {
                        context.pushNamed(Routes.signUpView);
                      },
                      child: Text(
                        "SignUp",
                        style: Styles.style18WPrimaryBoldCairo,
                      )),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
