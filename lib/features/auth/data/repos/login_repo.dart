import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:noteappwithphp/core/constants/api_constants.dart';
import 'package:noteappwithphp/core/errors/error.dart';
import 'package:noteappwithphp/core/utils/api_service.dart';

class LoginRepo {
  final ApiService apiService;
  const LoginRepo(this.apiService);

  Future<Either<Failure, Map<String, dynamic>>> login({
    required String email,
    required String password,
  }) async {
    Map<String, dynamic> data;
    // List notes = [];
    try {
      data = await apiService.post(
          endPoint: ApiConstants.loginUrl,
          data: {"email": email, "password": password});
      // for (var element in collection) {

      // }

      if (data['status'] == "Success") {
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
