import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteappwithphp/core/helpers/extentions.dart';
import 'package:noteappwithphp/core/routing/routes.dart';
import 'package:noteappwithphp/core/theme/styles.dart';
import 'package:noteappwithphp/core/utils/sqlflite.dart';
import 'package:noteappwithphp/core/widgets/custom_button.dart';
import 'package:noteappwithphp/core/widgets/custom_dialog.dart';
import 'package:noteappwithphp/core/widgets/cutom_textFormField.dart';
import 'package:noteappwithphp/features/auth/presentation/view_model/auth/auth_cubit.dart';
import 'package:noteappwithphp/features/auth/presentation/view_model/auth/auth_state.dart';

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
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) async {
        if (state is AuthFailure) {
          const CustomDialog()
              .show(context: context, title: "Error", desc: state.errMessage);
        } else if (state is AuthLoading) {
          const CustomDialog().loading(context: context);
        } else if (state is AuthSuccess) {
          List test = await SqlDb().getData("SELECT * FROM `user`");
          if (test.isEmpty) {
            await SqlDb().insertData(
                "INSERT INTO `user` (`isLogined`,`username`,`email`,`password`) VALUES ('TRUE','${username.text}','${email.text}','${password.text}')");
          } else {
            print("test $test");
            print("state.userData ${state.userData}");
            await SqlDb().updatetData(
                "UPDATE `user` SET isLogined = 1,`username` = '${state.userData['username']}',`email` = '${state.userData['email']}',`password` = '${state.userData['password']}'");
          }

          context.pushNamedAndRemoveUntil(
            Routes.homeView,
            predicate: (route) => false,
          );
        }
      },
      child: Padding(
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
              onPressed: () async {
                await BlocProvider.of<AuthCubit>(context).signUp(
                    username: username.text,
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
      ),
    );
  }
}
