import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:noteappwithphp/core/constants/api_constants.dart';
import 'package:noteappwithphp/core/errors/error.dart';
import 'package:noteappwithphp/core/utils/api_service.dart';

class SignUpRepo {
  final ApiService apiService;
  const SignUpRepo(this.apiService);

  Future<Either<Failure, Map<String, dynamic>>> signUp(
      {required String username,
      required String email,
      required String password}) async {
    Map<String, dynamic> data;
    // List notes = [];
    print("username ${username}, email ${email}, password ${password}");

    try {
      data = await apiService.post(endPoint: ApiConstants.signUpUrl, data: {
        "username": username,
        "email": email,
        "password": password,
      });
      // for (var element in collection) {

      // }
      if (data['status'] == "Success") {
        print("ddd $data");
        return Right(data);
      } else {
        return Left(ServerFailure(errMessage: data['status']));
      }
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(dioException: e));
      } else {
        return Left(ServerFailure(errMessage: e.toString()));
      }
    }
  }
}
