import 'dart:async';
import 'package:dahae_mobile/common/constants.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import 'package:dahae_mobile/common/util/dio_factory.dart';

class AuthAPI {
  // Generate Instance
  static final AuthAPI _authAPI = AuthAPI();
  // Get Instance of the class
  static AuthAPI get authAPIInstance => _authAPI;
  // Open Dio
  static final Dio _dio = const DioFactory(Constants.baseUrl).create();

  Future register(
      {required String phoneNumber,
      required String password,
      required String name,
      required String bloodType}) async {
    try {
      // Internet Connection check
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.none) {
        return "Internet Connection Invalid";
      }

      // request body
      final data = {
        "phoneNumber": phoneNumber,
        "password": password,
        "name": name,
        "bloodType": bloodType
      };
      print(data);
      // get
      final response = await _dio.post('/auth/register', data: data);

      if (response.statusCode == 201) {
        // 회원가입 성공
        return "Success";
      } else {
        // 400 : wrong pw -> 401 될수도있음
        // 404 : wrong id
        // 500 : server error
        // 회원가입 실패
        return "fail";
      }
    } catch (e) {
      //test log
      print("error");

      // error handling
    }
  }

  Future login({required String phoneNumber, required String password}) async {
    try {
      // Internet Connection check
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.none) {
        return "Internet Connection Invalid";
      }

      // request body
      final data = {"phoneNumber": phoneNumber, "password": password};

      // get
      print("Get");
      final response = await _dio.post('/auth/login', data: data);

      // test log
      print(response.statusCode);

      if (response.statusCode == 201) {
        // 로그인 성공시에 access token, refresh token 저장
        final box = await Hive.openBox('tokens');
        box.put('access_token', response.data['accessToken']);
        box.put('refresh_token', response.data['refreshToken']);
        print(response.data['accessToken']);

        //test log
        print("success");

        return "Success";
      } else {
        // 로그인 실패 - 아이디 또는 PW가 틀렸음을 안내
        print("fail");
        return "Wrong ID or PW";
      }
    } catch (e) {
      //test log
      print("error");

      // error handling
    }
  }
}
