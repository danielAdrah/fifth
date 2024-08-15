// ignore_for_file: avoid_print, unused_local_variable

import 'package:dio/dio.dart';
import 'package:fifth/controller/limit_controller.dart';
import 'package:fifth/controller/user_state.dart';
import 'package:fifth/core/api/end_point.dart';
import 'package:fifth/core/errors/excption.dart';
import 'package:fifth/model/accounts_model.dart';
import 'package:fifth/model/expense_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../model/categories_model.dart';
import '../model/subcategory_model.dart';
import '../model/piechart_model.dart';

class ExpenseController extends GetxController {
  final controller = Get.put(LimitController());
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
  Map<String, String> accountsMap = {
    "22": "Daily Expenses",
    "10": "Large Expenses"
  };
  RxBool created = false.obs;
  bool done = false;
  String? newItem;
  String? selectedCategory;
  var selectedCategoryId = ''.obs;
  var accountId = ''.obs;
  var subCategoryId = "".obs;
  var updatedSubCategoryId = "".obs;
  String cat = "Transport";
  RxBool expenseLoading = false.obs;
  RxBool expenseDone = false.obs;
  RxBool expenseFail = false.obs;
  RxBool expenseUpdated = false.obs;
  RxBool pieLoading = false.obs;
  var pie = PiechartModel(category: "", sum: 0).obs;
  RxList<ExpenseModel> expenses = <ExpenseModel>[].obs;
  RxList<CategoryModel> categories = <CategoryModel>[].obs;
  RxList<Subcategories> subCategories =
      <Subcategories>[].obs; //pass it when creating an expense
  RxList<AccountsModel> myAccounts =
      <AccountsModel>[].obs; //pass it when creating an expense
  RxList<PiechartModel> pieInfo = <PiechartModel>[].obs;
  RxMap piechartData = {}.obs;
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

      fetchSubcategory();
      return category;
    } on DioException catch (e) {
      print("Error fetching expenses: ${e.message}");
      throw Exception('Failed to load expenses: ${e.message}');
    }
  }

  //=============================
  Future<List<AccountsModel>> fetchAccount() async {
    var token = storage.read('accessToken');
    try {
      var response = await dio.get(
        EndPoint.myAccounts,
        options: Options(headers: {
          ApiKeys.auth: "Bearer $token",
        }),
      );
      print("accountssssssssss ${response.data}");
      List<dynamic> jsonResponse = response.data;
      List<AccountsModel> accounts = [];
      accounts = jsonResponse.map((e) => AccountsModel.fromJson(e)).toList();
      myAccounts.value = accounts;
      print("accountss numberrrrrrrrr ${accounts.length}");
      return accounts;
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
      expenseLoading.value = true;
      var token = storage.read('accessToken');
      print("the item token is $token");
      var response = await dio.get(
        EndPoint.myItems(accountId.value),
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

      expenses.value = expense;
      expenseLoading.value = false;
      return expense;
    } on DioException catch (e) {
      expenseLoading.value = false;

      print("Error fetching expenses: ${e.message}");
      throw Exception('Failed to load expenses: ${e.message}');
    }
  }

//================================

  createExpense() async {
    try {
      expenseDone.value = true;
      var token = storage.read("accessToken");
      // var accountId = storage.read('accountId');
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
            ApiKeys.account: accountId.value,
            ApiKeys.subcategory: subCategoryId.value,

            // ApiKeys.itemName: nameController.text,
            // ApiKeys.quantity: quantityController,
            // ApiKeys.price: priceController,
            // ApiKeys.account: 1,
            // ApiKeys.subcategory: subCategoryId.value,
          });
      print("the added expense is ${response.data}");
      print("newwwwwwwwwwwww ${subCategoryId.value}");
      userState = SuccessCreated();
      update();
      expenseDone.value = false;
      await displayExpense();
      await mainPieChart();
      await controller.displayLimits();
      await subPiechart();
    } on DioException catch (e) {
      expenseDone.value = false;
      expenseFail.value = true;
      print("Error fetching expenses: ${e.message}");
      throw Exception('Failed to load expenses: ${e.message}');
    }
  }

  //===================================
  updateExpense(int id) async {
    try {
      expenseUpdated.value = true;
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
          ApiKeys.account: accountId.value,
          ApiKeys.itemName: newNameController.text,
          ApiKeys.quantity: newQuantityController.text,
          ApiKeys.price: newPriceController.text,
          ApiKeys.subcategory: updatedSubCategoryId.value,
        },
      );
      print("the updated expense is ${response.data}");
      expenseUpdated.value = false;
      await displayExpense();
      await mainPieChart();
      await subPiechart();
    } on ServerExcption catch (e) {
      expenseUpdated.value = false;
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
      mainPieChart();
      subPiechart();
    } on ServerExcption catch (e) {
      throw Exception(
          'Failed to load posts: ${e.errModel.non_field_errors.toString()}');
    }
  }

  //============================
  deleteAccount(int id) async {
    try {
      print("from delete account");
      var token = storage.read("accessToken");

      var response = await dio.delete(
        EndPoint.deleteAccount(id),
        options: Options(headers: {
          ApiKeys.auth: "Bearer $token",
        }),
      );
      print("delete expense ${response.data}");
      fetchAccount();
    } on ServerExcption catch (e) {
      throw Exception(
          'Failed to load posts: ${e.errModel.non_field_errors.toString()}');
    }
  }

  //=========================
  mainPieChart() async {
    var token = storage.read("accessToken");
    try {
      pieLoading.value = true;
      var response = await dio.get(EndPoint.displayPiechart(accountId.value),
          options: Options(
            headers: {
              ApiKeys.auth: "Bearer $token",
            },
          ));
      print("from main pieeeeeee ${response.data}");
      List<dynamic> jsonResponse = response.data;
      List<PiechartModel> pieData =
          jsonResponse.map((e) => PiechartModel.fromJson(e)).toList();
      print("after parsing");
      pieInfo.value = pieData;
      pieLoading.value = false;
    } on DioException catch (e) {
      pieLoading.value = false;
      print("Error fetching expenses: ${e.message}");
      throw Exception('Failed to load expenses: ${e.message}');
    }
  }

  //==========================
  subPiechart() async {
    var token = storage.read("accessToken");
    try {
      var response = await dio.post(
        EndPoint.fetchSubPiechart(accountId.value),
        options: Options(
          headers: {
            ApiKeys.auth: "Bearer $token",
          },
        ),
        data: {
          ApiKeys.category: cat,
        },
      );
      print("from subpiechat ${response.data}");
    } on DioException catch (e) {
      print("Error fetching expenses: ${e.message}");
      throw Exception('Failed to load expenses: ${e.message}');
    }
  }
}
