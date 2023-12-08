import 'package:flutter/material.dart';
import 'package:noteappwithphp/core/helpers/extentions.dart';
import 'package:noteappwithphp/core/routing/routes.dart';
import 'package:noteappwithphp/core/theme/styles.dart';
import 'package:noteappwithphp/core/widgets/custom_button.dart';
import 'package:noteappwithphp/core/widgets/cutom_textFormField.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ListView(
        children: [
          Image.asset(
            "assets/images/note logo.png",
            scale: 4,
          ),
          CustomTextFormField(
            controller: username,
            hint: "Username",
          ),
          CustomTextFormField(
            controller: email,
            hint: "Email",
          ),
          CustomTextFormField(
            controller: password,
            hint: "Password",
          ),
          CustomButton(
            text: "SignUp",
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
              const Text("Already have an account?"),
              TextButton(
                  onPressed: () {
                    context.pushNamed(Routes.loginView);
                  },
                  child: Text(
                    "Login",
                    style: Styles.style18WPrimaryBoldCairo,
                  ))
            ],
          )
        ],
      ),
    );
  }
}
