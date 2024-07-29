// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:fifth/core/api/end_point.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LimitController extends GetxController {
  var dio = Dio(BaseOptions(
    baseUrl: "http://85.31.237.33/project/",
  ));
  final GetStorage storage = GetStorage();
  //======================================
  final TextEditingController amount = TextEditingController();
  final TextEditingController startDate = TextEditingController();
  final TextEditingController endDate = TextEditingController();

//========================================
  createLimit() async {
    var token = storage.read("accessToken");
    var id = storage.read("userId");
    print("id from limit $id");
    try {
      var response = await  dio.post(
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
          ApiKeys.currency :"ل.س",
          ApiKeys.category : "food",
        },
      );
      print("from create limit ${response.data}");
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