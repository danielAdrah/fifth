// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:fifth/core/api/end_point.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../model/individual_limit_model.dart';
import '../model/limits_model.dart';

class LimitController extends GetxController {
  var dio = Dio(BaseOptions(
    baseUrl: "http://85.31.237.33/project/",
  ));
  final GetStorage storage = GetStorage();
  //======================================
  final TextEditingController amount = TextEditingController();
  final TextEditingController startDate = TextEditingController();
  final TextEditingController endDate = TextEditingController();
  //======================================
  final TextEditingController newamount = TextEditingController();
  final TextEditingController newstartDate = TextEditingController();
  final TextEditingController newendDate = TextEditingController();
  //======================================
  Map<String, String> limitCategoryMap = {
    '1': 'food',
    '2': 'transport',
    '3': 'Home & Applainces',
    // '4': 'Train',
    // '5': 'Grocery',
    // '6': 'Furniture',
    // '7': 'House fixes',

    // Add more mappings as needed
  };
  var limitCategory = ''.obs;
  var updatedLimitCategory = ''.obs;
  RxList<LimitsModel> limitsList = <LimitsModel>[].obs;
  var oneLimit = IndividualLimitModel(
          category: 1,
          categoryName: "",
          currency: "",
          currentSpending: 0,
          endDate: DateTime.now(),
          id: 0,
          limit: 0,
          remainingAmount: 0,
          startDate: DateTime.now(),
          user: 0)
      .obs;

//========================================
  Future<List<LimitsModel>> displayLimits() async {
    var token = storage.read('accessToken');

    try {
      var response = await dio.get(
        EndPoint.showLimits,
        options: Options(
          headers: {
            ApiKeys.auth: "Bearer $token ",
          },
        ),
      );
      print("list of limits are ${response.data}");
      List<dynamic> jsonResponse = response.data;
      List<LimitsModel> limits = [];
      limits = jsonResponse.map((e) => LimitsModel.fromJson(e)).toList();
      print("after parsing");
      limitsList.value = limits;
      return limits;
    } on DioException catch (e) {
      print("Error fetching expenses: ${e.message}");
      throw Exception('Failed to load expenses: ${e.message}');
    }
  }
//=======================================

  createLimit() async {
    var token = storage.read("accessToken");
    var id = storage.read("userId");
    print("id from limit $id");
    try {
      var response = await dio.post(
        EndPoint.createLimit,
        options: Options(
          headers: {
            ApiKeys.auth: "Bearer $token ",
          },
        ),
        data: {
          ApiKeys.user: id,
          ApiKeys.startDate: startDate.text,
          ApiKeys.endDate: endDate.text,
          ApiKeys.limit: amount.text,
          ApiKeys.currency: "ل.س",
          ApiKeys.category: limitCategory.value,
        },
      );
      print("the idcategory for the limit issssssssssss${limitCategory.value}");
      print("from create limit ${response.data}");
      await displayLimits();
    } on DioException catch (e) {
      print("Error fetching expenses: ${e.message}");
      throw Exception('Failed to load expenses: ${e.message}');
    }
  }

//=======================================
  deleteLimit(int id) async {
    var token = storage.read("accessToken");

    try {
      var response = await dio.delete(
        EndPoint.deleteLimit(id),
        options: Options(
          headers: {
            ApiKeys.auth: "Bearer $token",
          },
        ),
      );
      print("delete limit ${response.data}");
      await displayLimits();
    } on DioException catch (e) {
      print("Error fetching expenses: ${e.message}");
      throw Exception('Failed to load expenses: ${e.message}');
    }
  }

//=======================================
  updateLimit(int id) async {
    var token = storage.read("accessToken");
    var userId = storage.read("userId");
    try {
      var response = await dio.put(
        EndPoint.updateLimit(id),
        options: Options(
          headers: {
            ApiKeys.auth: "Bearer $token",
          },
        ),
        data: {
          ApiKeys.user: userId,
          ApiKeys.startDate: newstartDate.text,
          ApiKeys.endDate: newendDate.text,
          ApiKeys.limit: newamount.text,
          ApiKeys.currency: "ل.س",
          ApiKeys.category: updatedLimitCategory.value,
        },
      );
      print("the updated limit is ${response.data}");
      await displayLimits();
    } on DioException catch (e) {
      print("Error fetching uodated expenses: ${e.message}");
      throw Exception('Failed to load expenses: ${e.message}');
    }
  }

  //=======================================
  Future<IndividualLimitModel> fetchLimit(int id) async {
    var token = storage.read("accessToken");
    try {
      var response = await dio.get(
        EndPoint.fetchLimit(id),
        options: Options(
          headers: {
            ApiKeys.auth: "Bearer $token",
          },
        ),
      );
      print("single limit issssssss ${response.data}");
      IndividualLimitModel limit = IndividualLimitModel.fromJson(response.data);
      print("after parsing in one limit ${limit.categoryName}");
      oneLimit.value = limit;
      return limit;
    } on DioException catch (e) {
      print("Error fetching expenses: ${e.message}");
      throw Exception('Failed to load expenses: ${e.message}');
    }
  }
}
