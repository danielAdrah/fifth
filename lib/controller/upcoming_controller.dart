// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:fifth/controller/user_state.dart';
import 'package:fifth/core/api/end_point.dart';
import 'package:fifth/model/upcoming_list_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class UpcomingController extends GetxController {
  var dio = Dio(BaseOptions(
    baseUrl: "http://85.31.237.33/project/",
  ));
  final GetStorage storage = GetStorage();
  UserState userState = UserInitial();
  //====================================
  final TextEditingController upcomeName = TextEditingController();
  final TextEditingController upcomePrice = TextEditingController();
  final TextEditingController upcomeDate = TextEditingController();
  final TextEditingController newupcomeName = TextEditingController();
  final TextEditingController newupcomePrice = TextEditingController();
  final TextEditingController newupcomeDate = TextEditingController();

  Map<String, String> upcomingCategoryMap = {
    '1': 'Fast food',
    '2': 'Taxi',
    '3': 'Bus',
    '4': 'Train',
    '5': 'Grocery',
    '6': 'Furniture',
    '7': 'House fixes',

    // Add more mappings as needed
  };
  //====================================
  RxList<UpcomingExpenseModel> upcomingList = <UpcomingExpenseModel>[].obs;
  var subcategoryUpcomingId = "".obs;
  var updatedSubcategoryUpcomingId = "".obs;
  RxBool upcomingLoading = false.obs;
  RxBool upcomingDone = false.obs;
  RxBool upcomingUpdate = false.obs;
  Future<List<UpcomingExpenseModel>> fetchUpcomingExpenses() async {
    var token = storage.read('accessToken');
    print("0");
    try {
      upcomingLoading.value = true;
      var response = await dio.get(
        // EndPoint.upcomingList,
        "charts/list-upcoming",
        options: Options(
          headers: {
            ApiKeys.auth: "Bearer $token ",
          },
        ),
      );
      print("hello from upcoming ${response.data}");
      List<dynamic> jsonResponse = response.data;
      List<UpcomingExpenseModel> upcoming = [];
      upcoming =
          jsonResponse.map((e) => UpcomingExpenseModel.fromJson(e)).toList();

      upcomingList.value = upcoming;
      upcomingLoading.value = false;
      return upcoming;
    } on DioException catch (e) {
      upcomingLoading.value = false;
      print("Error fetching expenses: ${e.message}");
      throw Exception('Failed to load expenses: ${e.message}');
    }
  }

//=============================
  createUpcoming() async {
    var token = storage.read('accessToken');
    var userId = storage.read("userId");
    try {
      upcomingDone.value = true;
      // done = false;
      update();
      var response = await dio.post(
          // EndPoint.createUpcoming,
          "charts/create-upcoming/",
          options: Options(
            headers: {
              ApiKeys.auth: "Bearer $token",
            },
          ),
          data: {
            ApiKeys.user: userId,
            ApiKeys.name: upcomeName.text,
            ApiKeys.price: upcomePrice.text,
            ApiKeys.date: upcomeDate.text,
            ApiKeys.subcategory: subcategoryUpcomingId.value,
          });
      print("from ceate upcome ${response.data}");
      print("loooooooooook ${subcategoryUpcomingId.value}");
      await fetchUpcomingExpenses();
      upcomingDone.value = false;

      update();
    } on DioException catch (e) {
      upcomingDone.value = false;

      update();
      print("Error fetching expenses: ${e.message}");
      throw Exception('Failed to load expenses: ${e.message}');
    }
  }

  //======================
  deleteUpcoming(int id) async {
    var token = storage.read('accessToken');
    try {
      print("from deleteUp");
      var token = storage.read("accessToken");

      var response = await dio.delete(
        EndPoint.deleteUpcoming(id),
        options: Options(headers: {
          ApiKeys.auth: "Bearer $token",
        }),
      );
      print("delete expense ${response.data}");
      fetchUpcomingExpenses();
    } on DioException catch (e) {
      print("Error fetching expenses: ${e.message}");
      throw Exception('Failed to load expenses: ${e.message}');
    }
  }

  //=============================
  updateUpcoming(id) async {
    var token = storage.read('accessToken');
    var userId = storage.read("userId");
    try {
      upcomingUpdate.value = true;
      var response = await dio.put(EndPoint.updateUpcoming(id),
          options: Options(
            headers: {
              ApiKeys.auth: "Bearer $token",
            },
          ),
          data: {
            // ApiKeys.user: userId,
            // ApiKeys.name: newupcomeName.text,
            // ApiKeys.price: newupcomePrice.text,
            // ApiKeys.date: newupcomeDate.text,
            // ApiKeys.subcategory: updatedSubcategoryUpcomingId.value,
            ApiKeys.user: userId,
            ApiKeys.name: newupcomeName.text,
            ApiKeys.price: newupcomePrice.text,
            ApiKeys.date: newupcomeDate.text,
            ApiKeys.subcategory: updatedSubcategoryUpcomingId.value,
          });
      print("from update upcome ${response.data}");
      print("loooooooooook ${updatedSubcategoryUpcomingId.value}");
      upcomingUpdate.value = false;
      await fetchUpcomingExpenses();
    } on DioException catch (e) {
      upcomingUpdate.value = false;
      print("Error fetching expenses: ${e.message}");
      throw Exception('Failed to load expenses: ${e.message}');
    }
  }
}
