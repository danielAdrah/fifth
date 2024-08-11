// ignore_for_file: avoid_print, unnecessary_brace_in_string_interps, unused_local_variable

import 'dart:convert';
import 'dart:io';

import 'package:fifth/core/api/end_point.dart';
import 'package:fifth/core/errors/excption.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import '../core/api/api_consmer.dart';
import '../model/accounts_model.dart';
import '../model/profile_info_model.dart';
import '../model/test_model.dart';
import 'user_state.dart';
import 'package:http/http.dart' as http;
import "../core/api/end_point.dart";
import "../model/login_model.dart";
import "../model/signup_model.dart";
import "package:get_storage/get_storage.dart";

class UserController extends GetxController {
  final ApiConsumer api;
  var dio = Dio(BaseOptions(
    baseUrl: "http://85.31.237.33/project/",
  ));

  //===========================SignUp TextControllers=====================================================
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  TextEditingController txtName = TextEditingController();
  TextEditingController txtConfPass = TextEditingController();
  //===========================SignIn TextControllers==================================
  TextEditingController signIntxtEmail = TextEditingController();
  TextEditingController signIntxtPassword = TextEditingController();
  //======================================================================
  TextEditingController accountName = TextEditingController();
  TextEditingController accountBudget = TextEditingController();
  TextEditingController accountCurrency = TextEditingController();
  TextEditingController accountNote = TextEditingController();
  //====================================================================
  UserState userState = UserInitial();
  UserController({required this.api});
  LogInModel? user;
  ProfileModel? pro;
  AccountsModel? account;
  SignUpModel? signUpUser;
  Rx<ProfileModel>? userProfile;
  RxBool secure = true.obs;
  RxBool cSecure = true.obs;
  RxBool signInSecure = true.obs;
  final GetStorage storage = GetStorage();

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

  createAccount() async {
    var userId = storage.read('userId');
    print("user id from create is $userId");
    var token = storage.read('accessToken');
    userState = AccountLoading();
    update();
    try {
      var response = await dio.post(
        EndPoint.createAccount,
        options: Options(
          headers: {
            ApiKeys.auth: "Bearer $token",
          },
        ),
        data: {
          ApiKeys.name: accountName.text,
          ApiKeys.currency: accountCurrency.text,
          ApiKeys.notes: accountNote.text,
          ApiKeys.budget: accountBudget.text,
          ApiKeys.user: userId,
        },
      );
      print("after create parsing");
      account = AccountsModel.fromJson(response.data);
      var accountId = account!.id;
      storage.write('accountId', accountId);
      print("account id after parsing $accountId");
      userState = AccountSuccess();
      update();
    } on DioException catch (e) {
      userState = AccountFail();
      update();
      print("Error creating an account : ${e.message}");
      throw Exception('Failed to create account: ${e.message}');
    }
  }

  fetchUserInfo() async {
    var token = storage.read('accessToken');
    var userId = storage.read('userId');
    try {
      var response = await dio.get(
        EndPoint.profileInfo(userId),
        options: Options(
          headers: {
            ApiKeys.auth: "Bearer $token",
          },
        ),
      );
      print("hi from profile ${response.data}");
      List<dynamic> jsonResponse = response.data;
      pro = ProfileModel.fromJson(response.data);
      print("after parsing ${pro?.username}");
    } on DioException catch (e) {
      print("Error fetching expenses: ${e.message}");
      throw Exception('Failed to load expenses: ${e.message}');
    }
  }
}
