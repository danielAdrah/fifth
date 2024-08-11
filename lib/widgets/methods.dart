import 'package:fifth/controller/expense_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/categories_model.dart';
import '../theme.dart';

final controller = Get.put(ExpenseController());

FutureBuilder<List<CategoryModel>> categoryDropdown() {
  return FutureBuilder<List<CategoryModel>>(
    future: controller.fetchCategory(),
    builder:
        (BuildContext context, AsyncSnapshot<List<CategoryModel>> snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return Text(
          "Please Wait ...",
          style: TextStyle(color: TColor.white),
        );
      } else if (snapshot.hasError) {
        return Text('Error: ${snapshot.error}');
      } else {
        return Container(
          decoration: BoxDecoration(
              color: TColor.gray60.withOpacity(0.8),
              borderRadius: BorderRadius.circular(15)),
          width: 320,
          child: DropdownButton<String>(
            borderRadius: BorderRadius.circular(25),

            hint: Obx(
              () => controller.selectedCategoryId.value.isNotEmpty
                  ? Text(controller.selectedCategoryId.value,
                      style: TextStyle(color: TColor.white))
                  : Text("Select a category",
                      style: TextStyle(color: TColor.white.withOpacity(0.4))),
            ),
            items: snapshot.data!.map((CategoryModel category) {
              return DropdownMenuItem<String>(
                value: category.name.toString(),
                child: Row(
                  children: [
                    Text(
                      category.name,
                      style: TextStyle(color: TColor.white),
                    ),
                  ],
                ), // Display the category name
              );
            }).toList(),
            isExpanded: true,
            padding: EdgeInsets.symmetric(horizontal: 12),
            underline: Text(
              "",
              style: TextStyle(color: TColor.white),
            ),
            onChanged: (String? val) {
              if (val != null) {
                controller.selectedCategoryId.value = val;
                controller.fetchSubcategory();
              }
            }, //o Implement your logic here when a selection changes
          ),
        );
      
      }
    },
  );
}

//=============================
Obx subCategoryDropdown() {
  return Obx(() => controller.subCategories.isEmpty
      ? Text(
          "Please Wait ...",
          style: TextStyle(color: TColor.white),
        )
      : Container(
          decoration: BoxDecoration(
              color: TColor.gray60.withOpacity(0.8),
              borderRadius: BorderRadius.circular(15)),
          width: 320,
          child: DropdownButton(
              hint: Obx(() => controller.subCategoryId.value.isNotEmpty
                  ? Text(
                      controller.subCategoryTextMap[
                              controller.subCategoryId.value] ??
                          "Select a subcategory",
                      style: TextStyle(color: TColor.white),
                    )
                  : Text(
                      "Select a subcategory",
                      style: TextStyle(color: TColor.white.withOpacity(0.4)),
                    )),
              items: controller.subCategories.value.map((e) {
                return DropdownMenuItem(
                  value: e.id.toString(),
                  child: Text(e.name, style: TextStyle(color: TColor.white)),
                );
              }).toList(),
              underline: Text(
                "",
                style: TextStyle(color: TColor.white),
              ),
              isExpanded: true,
              padding: EdgeInsets.symmetric(horizontal: 12),
              onChanged: (String? val) {
                if (val != null) {
                  controller.subCategoryId.value = val;
                }
              }),
        ));
}
