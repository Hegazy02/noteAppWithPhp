import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:noteappwithphp/core/utils/api_service.dart';
import 'package:noteappwithphp/features/auth/data/repos/login_repo.dart';
import 'package:noteappwithphp/features/auth/data/repos/signUp_repo.dart';

class ServiceLocator {
  static final getIt = GetIt.instance;
  static setup() {
    getIt.registerSingleton<SignUpRepo>(
      SignUpRepo(
        ApiService(Dio()),
      ),
    );
    getIt.registerSingleton<LoginRepo>(
      LoginRepo(
        ApiService(Dio()),
      ),
    );
  }
}
