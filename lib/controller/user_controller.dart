// ignore_for_file: avoid_print, unnecessary_brace_in_string_interps

import 'dart:convert';
import 'dart:io';

import 'package:fifth/core/api/end_point.dart';
import 'package:fifth/core/errors/excption.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import '../core/api/api_consmer.dart';
import '../model/test_model.dart';
 import '../view/bottom_bar/bottom_bar_view.dart';
import 'user_state.dart';
import 'package:http/http.dart' as http;
import "../core/api/end_point.dart";
import "../model/login_model.dart";
import "../model/signup_model.dart";
import "package:get_storage/get_storage.dart";

class UserController extends GetxController {
  final ApiConsumer api;
  var dio = Dio(
      //   BaseOptions(
      //   baseUrl: "https://85.31.237.33/project/",
      // )
      );

  //===========================SignUp TextControllers=====================================================
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  TextEditingController txtName = TextEditingController();
  TextEditingController txtConfPass = TextEditingController();
  //===========================SignIn TextControllers==================================
  TextEditingController signIntxtEmail = TextEditingController();
  TextEditingController signIntxtPassword = TextEditingController();
  //======================================================================
  UserState userState = UserInitial();
  UserController({required this.api});
  LogInModel? user;
  SignUpModel? signUpUser;
   RxBool secure = true.obs;
  RxBool cSecure = true.obs;
  RxBool signInSecure = true.obs;
  final GetStorage storage = GetStorage();
  // signUp2() async {
  //   userState = SignInLoading();
  //   update();
  //   try {
  //     print("1");
  //     final response = await http.post(
  //       Uri.parse("http://85.31.237.33/project/auth/sign-up/"),
  //       body: jsonEncode({
  //         ApiKeys.email: txtEmail.text,
  //         ApiKeys.username: txtName.text,
  //         ApiKeys.password: txtPassword.text,
  //         ApiKeys.confpassword: txtConfPass.text,
  //       }),
  //     );
  //     print("2");
  //     print("the response is ");
  //     print(response.body.toString());
  //     if (response.statusCode == 200) {
  //       Map<String, dynamic> responseBody = jsonDecode(response.body);
  //       print("from login $responseBody");
  //     } else {
  //       throw Exception(
  //           'Failed to log in with status code ${response.statusCode}');
  //     }
  //   } catch (e) {
  //     if (e is http.ClientException) {
  //       print("HTTP request failed, error: ${e.message}");
  //     } else if (e is FormatException) {
  //       print("Failed to parse JSON, error: ${e.message}");
  //     } else if (e is Exception) {
  //       // Catch general exceptions
  //       print("An unexpected error occurred: ${e.toString()}");
  //     } else {
  //       print("Unknown error: $e");
  //     }
  //     // userState =
  //     //     SignInFailure(errMessage: e.errModel.non_field_errors.toString());
  //     // update();
  //   }
  // }

  singIn() async {
    userState = SignInLoading();
    update();

    try {
      final response = await api.post(
        EndPoint.logIn,
        data: {
          ApiKeys.username: signIntxtEmail.text,
          ApiKeys.password: signIntxtPassword.text,
        },
      );
      user = LogInModel.fromJson(response);

      final accessToken = user!.tokens.access;
      final refreshToken = user!.tokens.refresh;
      final userId = user!.id;
      print("the id is $userId");
      print("the access token from the signIn is $accessToken");
      print("the refresh token from the signIn is $refreshToken");

      storage.write('accessToken', accessToken);
      storage.write('refreshToken', refreshToken);
      storage.write('userId', userId);
      userState = SignInSuccess();
      update();
     } on ServerExcption catch (e) {
      userState =
          SignInFailure(errMessage: e.errModel.non_field_errors.toString());
      update();
    }
  }


  SignUp() async {
    userState = SignUpLoading();
    update();
    print("e");
    try {
      final response = await api.post(
        EndPoint.signUp,
        data: {
          // ApiKeys.email: txtEmail.text,
          // ApiKeys.username: txtName.text,
          // ApiKeys.password: txtPassword.text,
          // ApiKeys.confpassword: txtConfPass.text,
          "email": txtEmail.text,
          "username": txtName.text,
          "password": txtPassword.text,
          "confirm_password": txtConfPass.text,
        },
      );
      signUpUser = SignUpModel.fromJson(response);
      print("@2");

      // final signupAccessToken = signUpUser!.tokens.accsess;
      // final signupRefreshToken = signUpUser!.tokens.refresh;
      // storage.write('signupRefreshToken', signupRefreshToken);
      // storage.write('signupAccessToken', signupAccessToken);
      // print("the access token from the signUp is $signupAccessToken");
      userState = SignUpSuccess();
      update();
      // Get.offAll(const BottomBarView());
      print("$signUpUser");
    } on ServerExcption catch (e) {
      userState =
          SignUpFailure(errMessage: e.errModel.non_field_errors.toString());
      update();
    }
  }
}
