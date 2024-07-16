// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:fifth/controller/user_state.dart';
import 'package:fifth/core/api/end_point.dart';
import 'package:fifth/core/errors/excption.dart';
import 'package:fifth/model/expense_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get_storage/get_storage.dart';

class ExpenseController extends GetxController {
  var dio = Dio(BaseOptions(
    baseUrl: "https://85.31.237.33:9000/project/",
  ));
  final GetStorage storage = GetStorage();
  UserState userState = UserInitial();

//===============
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  String? item;
  //===============================================
  TextEditingController newNameController = TextEditingController();
  TextEditingController newPriceController = TextEditingController();
  TextEditingController newQuantityController = TextEditingController();
  String? newItem;
  RxBool isAdded = false.obs;
  bool isDone = false;

  RxList<ExpenseModel> expenses = <ExpenseModel>[].obs;
//==============================

  Future<List<ExpenseModel>> displayExpense() async {
    try {
      var token = storage.read('accessToken');
      print("the item token is $token");
      var response = await dio.get(
        EndPoint.listItems,
        options: Options(
          headers: {
            ApiKeys.auth: "Bearer $token ",
          },
        ),
      );
      print("the list response is ${response.data}");
      List<dynamic> jsonResponse = response.data;
      print("look from displayData $jsonResponse");
      List<ExpenseModel> expense = [];
      expense = jsonResponse.map((e) => ExpenseModel.fromJson(e)).toList();
      var exp_id = expense.map((e) => e.id);
      storage.write("expId", exp_id);
      print("info after parsing ${expense[0].itemName}");
      expenses.value = expense;
      return expense;
    } on DioException catch (e) {
      print("Error fetching expenses: ${e.message}");
      throw Exception('Failed to load expenses: ${e.message}');
    }
  }

//================================
  createExpense() async {
    try {
      var token = storage.read("accessToken");
      print("token from create expense $token");
      var response = await dio.post(EndPoint.createItem,
          options: Options(
            headers: {
              ApiKeys.auth: "Bearer $token",
            },
          ),
          data: {
            ApiKeys.expenseType: item,
            ApiKeys.itemName: nameController.text,
            ApiKeys.quantity: quantityController.text,
            ApiKeys.price: priceController.text,
          });
      print("the added expense is ${response.data}");
      isAdded.value = true;
      isDone = true;
      update();

      await displayExpense();
    } on ServerExcption catch (e) {}
  }

  //===================================
  updateExpense(int id) async {
    try {
      var token = storage.read("accessToken");
      var response = await dio.put(
        EndPoint.updateExpense(id),
        options: Options(
          headers: {
            ApiKeys.auth: "Bearer $token",
          },
        ),
        data: {
          ApiKeys.expenseType: newItem,
          ApiKeys.itemName: newNameController.text,
          ApiKeys.quantity: newQuantityController.text,
          ApiKeys.price: newPriceController.text,
        },
      );
      print("the updated expense is ${response.data}");
      await displayExpense();
    } on ServerExcption catch (e) {
      throw Exception(
          'Failed to load posts: ${e.errModel.non_field_errors.toString()}');
    }
  }

  //=====================================
  deleteExpense(int id) async {
    try {
      print("from delete");
      var token = storage.read("accessToken");

      var response = await dio.delete(
        EndPoint.deleteItem(id),
        options: Options(headers: {
          ApiKeys.auth: "Bearer $token",
        }),
      );
      print("delete expense ${response.data}");
      displayExpense();
    } on ServerExcption catch (e) {
      throw Exception(
          'Failed to load posts: ${e.errModel.non_field_errors.toString()}');
    }
  }
}
