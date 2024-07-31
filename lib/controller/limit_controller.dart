// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:fifth/core/api/end_point.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

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
//========================================
  RxList<LimitsModel> limitsList = <LimitsModel>[].obs;
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
    var id = storage.read("userId");
    try {
      var response = await dio.put(
        EndPoint.updateLimit(id),
        options: Options(
          headers: {
            ApiKeys.auth: "Bearer $token",
          },
        ),
        data: {
          ApiKeys.user: id,
          ApiKeys.startDate: "2024-1-2",
          ApiKeys.endDate: "2024-1-4",
          ApiKeys.limit: "500",
          ApiKeys.currency: "ل.س",
          ApiKeys.category: "1",
        },
      );
      print("the updated limit is ${response.data}");
      await displayLimits();
    } on DioException catch (e) {
      print("Error fetching expenses: ${e.message}");
      throw Exception('Failed to load expenses: ${e.message}');
    }
  }
}

// FutureBuilder<List<CategoryModel>>(
//   future: controller.fetchCategory(),
//   builder: (BuildContext context, AsyncSnapshot<List<CategoryModel>> snapshot) {
//     if (snapshot.connectionState == ConnectionState.waiting) {
//       return CircularProgressIndicator(); // Show a loading indicator while waiting for data
//     } else if (snapshot.hasError) {
//       return Text('Error: ${snapshot.error}'); // Handle any errors
//     } else {
//       return DropdownButton<String>(
//         isExpanded: true, // Allow the dropdown button to take more space
//         hint: Obx(() => controller.selectedCategoryId.value.isNotEmpty
//             ? Text(controller.categoryTextMap[controller.selectedCategoryId.value] ?? "Select a category") // Display the mapped text or default hint
//             : Text("Select a category")), // Default hint text
//         items: snapshot.data!.map((CategoryModel category) {
//           return DropdownMenuItem<String>(
//             value: category.id,
//             child: Text(category.name),
//           );
//         }).toList(),
//         onChanged: (String? newValue) {
//           if (newValue != null) {
//             controller.selectedCategoryId.value = newValue; // Update the state variable
//           }
//         },
//       );
//     }
//   },
// )