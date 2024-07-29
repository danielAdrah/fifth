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

import '../model/categories_model.dart';
import '../model/subcategory_model.dart';

class ExpenseController extends GetxController {
  var dio = Dio(BaseOptions(
    baseUrl: "http://85.31.237.33/project/",
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
  //================================================
  Map<String, String> subCategoryTextMap = {
    '1': 'Fast food',
    '2': 'Taxi',
    '3': 'Bus',
    '4': 'Train',
    '5': 'Grocery',
    '6': 'Furniture',
    '7': 'House fixes',

    // Add more mappings as needed
  };
  String? newItem;
  RxBool isAdded = false.obs;
  bool isDone = false;
  String? selectedCategory;
  var selectedCategoryId = ''.obs;
  var subCategoryId = "".obs;
  var updatedSubCategoryId = "".obs;
  RxList<ExpenseModel> expenses = <ExpenseModel>[].obs;
  RxList<CategoryModel> categories = <CategoryModel>[].obs;
  RxList<Subcategories> subCategories =
      <Subcategories>[].obs; //pass it when creating an expense

//==============================

  Future<List<CategoryModel>> fetchCategory() async {
    try {
      var response = await dio.get(
        EndPoint.categories,
      );
      print("category ${response.data}");
      List<dynamic> jsonResponse = response.data;
      List<CategoryModel> category = [];
      category = jsonResponse.map((e) => CategoryModel.fromJson(e)).toList();
      categories.value = category;
      print("${category[1].name}");
      fetchSubcategory();
      return category;
    } on DioException catch (e) {
      print("Error fetching expenses: ${e.message}");
      throw Exception('Failed to load expenses: ${e.message}');
    }
  }

  Future<List<Subcategories>> fetchSubcategory() async {
    try {
      var response = await dio.get(
        EndPoint.subCategories,
        queryParameters: {
          ApiKeys.category_name: selectedCategoryId.value,
        },
      );
      print("eeeeeeeeeeeeeeee ${subCategoryId.value}");
      print("Subcategory ${response.data}");
      List<dynamic> jsonResponse = response.data;
      List<Subcategories> subCategory = [];
      subCategory = jsonResponse.map((e) => Subcategories.fromJson(e)).toList();

      subCategories.value = subCategory;
      print("length ${subCategories.length}");
      return subCategory;
    } on DioException catch (e) {
      print("Error fetching expenses: ${e.message}");
      throw Exception('Failed to load expenses: ${e.message}');
    }
  }

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
      print("the listtttttttttt response is ${response.data}");
      List<dynamic> jsonResponse = response.data;
      print("look from displayData $jsonResponse");
      List<ExpenseModel> expense = [];
      expense = jsonResponse.map((e) => ExpenseModel.fromJson(e)).toList();
      var expId = expense.map((e) => e.id);
      storage.write("expId", expId);
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
            ApiKeys.itemName: nameController.text,
            ApiKeys.quantity: quantityController.text,
            ApiKeys.price: priceController.text,
            ApiKeys.account: 1,
            ApiKeys.subcategory: subCategoryId.value,

            // ApiKeys.itemName: nameController.text,
            // ApiKeys.quantity: quantityController,
            // ApiKeys.price: priceController,
            // ApiKeys.account: 1,
            // ApiKeys.subcategory: subCategoryId.value,
          });
      print("the added expense is ${response.data}");
      isAdded.value = true;
      isDone = true;
      update();

      await displayExpense();
    } on DioException catch (e) {
      print("Error fetching expenses: ${e.message}");
      throw Exception('Failed to load expenses: ${e.message}');
    }
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
          // ApiKeys.expenseType: newItem,
          // ApiKeys.itemName: newNameController.text,
          // ApiKeys.quantity: newQuantityController.text,
          // ApiKeys.price: newPriceController.text,
          ApiKeys.account :1,
          ApiKeys.itemName :newNameController.text,
          ApiKeys.quantity : newQuantityController.text,
          ApiKeys.price:newPriceController.text,
          ApiKeys.subcategory :updatedSubCategoryId.value,
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
