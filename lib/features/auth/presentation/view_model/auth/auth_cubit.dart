import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteappwithphp/core/utils/service_locator.dart';
import 'package:noteappwithphp/core/widgets/custom_dialog.dart';
import 'package:noteappwithphp/features/auth/data/repos/login_repo.dart';
import 'package:noteappwithphp/features/auth/data/repos/signUp_repo.dart';
import 'package:noteappwithphp/features/auth/presentation/view_model/auth/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  signUp(
      {required String username,
      required String email,
      required String password,
      required BuildContext context}) async {
    emit(AuthLoading());

    var reponse = await ServiceLocator.getIt<SignUpRepo>()
        .signUp(username: username, email: email, password: password);
    reponse.fold((failed) {
      emit(AuthFailure(errMessage: failed.errMessage));

      print("failed ${failed.errMessage}");
    }, (data) {
      emit(AuthSuccess(userData: data['userData']));
      print("data $data");
    });
  }

  login(
      {required String email,
      required String password,
      required BuildContext context}) async {
    emit(AuthLoading());

    var reponse = await ServiceLocator.getIt<LoginRepo>()
        .login(email: email, password: password);
    reponse.fold((failed) {
      emit(AuthFailure(errMessage: failed.errMessage));

      print("failed ${failed.errMessage}");
      const CustomDialog()
          .show(context: context, title: "Error", desc: failed.errMessage);
    }, (data) {
      emit(AuthSuccess(userData: data['userData']));
      print("data ${data}");
    });
  }
}
