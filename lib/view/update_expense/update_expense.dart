// ignore_for_file: prefer_const_constructors

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dropdown_search/dropdown_search.dart';

import '../../common/show_dialoge.dart';
import '../../controller/expense_controller.dart';

// import 'package:awesome_dialog/awesome_dialog.dart';
import '../../theme.dart';
import '../../common/rounded_textField.dart';
import '../../common/primary_button.dart';
import '../../widgets/methods.dart';

class UpdateExpense extends StatefulWidget {
  UpdateExpense({super.key, required this.id});
  int id;

  @override
  State<UpdateExpense> createState() => _UpdateExpenseState();
}

class _UpdateExpenseState extends State<UpdateExpense> {
  DateTime date = DateTime.now();

  List<String> items = [
    "Food",
    "Drinks",
    "Entertainment",
    "Education",
    "Other"
  ];

  void clearField() {
    controller.newNameController.clear();
    controller.newPriceController.clear();
    controller.newQuantityController.clear();
  }

  final controller = Get.put(ExpenseController());

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: TColor.gray.withOpacity(0.9),
      body: SafeArea(
        child: ListView(
          children: [
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // const SizedBox(height: 10),
                FadeInLeft(
                  delay: Duration(milliseconds: 100),
                  curve: Curves.decelerate,
                  child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: TColor.white,
                        size: 30,
                      )),
                ),
                FadeInDown(
                  delay: Duration(milliseconds: 100),
                  curve: Curves.decelerate,
                  child: Text(
                    "Update Expense",
                    style: TextStyle(
                        color: TColor.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        decoration: TextDecoration.none),
                  ),
                ),
                Icon(
                  Icons.spellcheck_rounded,
                  color: TColor.black,
                ),
              ],
            ),
            Stack(alignment: Alignment.center, children: [
              // const SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.only(
                    right: media.width * 0.055,
                    left: media.width * 0.055,
                    top: media.width * 0.05),
                child: Container(
                  alignment: Alignment.topLeft,
                  height: 700,
                  decoration: BoxDecoration(
                      color: TColor.gray70.withOpacity(1),
                      borderRadius: BorderRadius.circular(25)),
                  child: FadeInDown(
                    delay: Duration(milliseconds: 100),
                    curve: Curves.decelerate,
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Category",
                                style: TextStyle(
                                    color: TColor.white.withOpacity(0.4),
                                    fontSize: 12),
                              ),
                            ),
                            categoryDropdown(),
                          ],
                        ),
                        SizedBox(height: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "SubCategory",
                                style: TextStyle(
                                    color: TColor.white.withOpacity(0.4),
                                    fontSize: 12),
                              ),
                            ),
                            Obx(() => controller.subCategories.isEmpty
                                ? Text(
                                    "Please Wait ...",
                                    style: TextStyle(color: TColor.white),
                                  )
                                : Container(
                                    decoration: BoxDecoration(
                                        color: TColor.gray60.withOpacity(0.8),
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    width: 320,
                                    child: DropdownButton(
                                        hint: Obx(() => controller
                                                .updatedSubCategoryId
                                                .value
                                                .isNotEmpty
                                            ? Text(
                                                controller.subCategoryTextMap[
                                                        controller
                                                            .updatedSubCategoryId
                                                            .value] ??
                                                    "Select a subcategory",
                                                style: TextStyle(
                                                    color: TColor.white),
                                              )
                                            : Text(
                                                "Select a subcategory",
                                                style: TextStyle(
                                                    color: TColor.white
                                                        .withOpacity(0.4)),
                                              )),
                                        items: controller.subCategories.value
                                            .map((e) {
                                          return DropdownMenuItem(
                                            value: e.id.toString(),
                                            child: Text(e.name,
                                                style: TextStyle(
                                                    color: TColor.white)),
                                          );
                                        }).toList(),
                                        underline: Text(
                                          "",
                                          style: TextStyle(color: TColor.white),
                                        ),
                                        isExpanded: true,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 12),
                                        onChanged: (String? val) {
                                          if (val != null) {
                                            controller.updatedSubCategoryId
                                                .value = val;
                                          }
                                        }),
                                  )),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.all(media.width * 0.04),
                          child: RoundedTextField(
                            title: "New Name",
                            controller: controller.newNameController,
                            icon: Icon(Icons.near_me),
                            onIconPressed: () {},
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(media.width * 0.04),
                          child: RoundedTextField(
                            title: "New Quantity",
                            controller: controller.newQuantityController,
                            icon: Icon(Icons.near_me),
                            onIconPressed: () {},
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(media.width * 0.04),
                          child: RoundedTextField(
                            title: "New Price",
                            controller: controller.newPriceController,
                            keyboardType: TextInputType.number,
                            icon: Icon(Icons.money),
                            onIconPressed: () {},
                          ),
                        ),
                        const SizedBox(height: 50),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: PrimaryButton(
                              title: "Update",
                              onPressed: () {
                                controller.updateExpense(widget.id);
                                if (controller.expenseUpdated.value) {
                                  showDoneSuccess(
                                      context, "Successfully Updated");
                                }
                                clearField();
                              }),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
