import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final Dio _dio;

  const ApiService(this._dio);
  Future<Map<String, dynamic>> get({required String endPoint}) async {
    Response response = await _dio.get(endPoint);
    return response.data;
  }

  test({required String endPoint, required Map data}) async {
    http.Response response = await http.post(Uri.parse(endPoint), body: data);
    if (response.statusCode == 200) {
      print("ssssssss");
    } else {
      print("kkk ${jsonDecode(jsonEncode(response.body))}");
    }
    return jsonDecode(jsonEncode(response.body));
  }

  Future<Map<String, dynamic>> post(
      {required String endPoint, required Map<String, dynamic> data}) async {
    Response response = await _dio.post(endPoint,
        data: data,
        options: Options(headers: {
          HttpHeaders.acceptHeader: "json/application/json",
          HttpHeaders.contentTypeHeader: "application/x-www-form-urlencoded"
        }));

    return jsonDecode(response.data) as Map<String, dynamic>;
  }
}
