import 'package:flutter/material.dart';
import 'package:noteappwithphp/core/helpers/extentions.dart';
import 'package:noteappwithphp/core/routing/routes.dart';
import 'package:noteappwithphp/core/theme/styles.dart';
import 'package:noteappwithphp/core/widgets/custom_button.dart';
import 'package:noteappwithphp/core/widgets/cutom_textFormField.dart';

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
              onPressed: () {
                context.pushNamedAndRemoveUntil(
                  Routes.homeView,
                  predicate: (route) => false,
                );
              },
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const Text("You don't have an account?"),
                TextButton(
                    onPressed: () {
                      context.pushNamed(Routes.signUpView);
                    },
                    child: Text(
                      "SignUp",
                      style: Styles.style18WPrimaryBoldCairo,
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
