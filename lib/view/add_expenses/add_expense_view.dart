// ignore_for_file: prefer_const_constructors, invalid_use_of_protected_member, unused_local_variable

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/fali_alert.dart';
import '../../common/show_dialoge.dart';
import '../../controller/expense_controller.dart';

// import 'package:awesome_dialog/awesome_dialog.dart';
import '../../theme.dart';
import '../../common/rounded_textField.dart';
import '../../common/primary_button.dart';
import '../../widgets/methods.dart';

class AddExpenseView extends StatefulWidget {
  const AddExpenseView({super.key});

  @override
  State<AddExpenseView> createState() => _AddExpenseViewState();
}

class _AddExpenseViewState extends State<AddExpenseView> {
  DateTime date = DateTime.now();
  List<String> items = [
    "Food",
    "Drinks",
    "Entertainment",
    "Education",
    "Other"
  ];

  void clearField() {
    controller.nameController.clear();
    controller.priceController.clear();
    controller.quantityController.clear();
  }

  final controller = Get.put(ExpenseController());

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

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
                    "Add Expense",
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
                            subCategoryDropdown(),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.all(media.width * 0.06),
                          child: RoundedTextField(
                            title: "Name",
                            controller: controller.nameController,
                            icon: Icon(Icons.near_me),
                            onIconPressed: () {},
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(media.width * 0.06),
                          child: RoundedTextField(
                            title: "Quantity",
                            controller: controller.quantityController,
                            icon: Icon(Icons.near_me),
                            onIconPressed: () {},
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(media.width * 0.06),
                          child: RoundedTextField(
                            title: "Price",
                            controller: controller.priceController,
                            keyboardType: TextInputType.number,
                            icon: Icon(Icons.money),
                            onIconPressed: () {},
                          ),
                        ),
                        const SizedBox(height: 50),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: PrimaryButton(
                              title: "Create",
                              onPressed: () {
                                controller.createExpense();
                                if (controller.expenseDone.value) {
                                  showDoneSuccess(
                                      context, "Successfully Created");
                                }
                                // if (controller.nameController.text.isEmpty &&
                                //     controller
                                //         .quantityController.text.isEmpty &&
                                //     controller.priceController.text.isEmpty) {
                                //   _showawesomeFail(context);
                                // }

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

_showawesomeFail(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible:
        true, // Set to false if you want the dialog to not close when tapping outside
    builder: (BuildContext context) {
      return ZoomIn(
        delay: Duration(milliseconds: 150),
        curve: Curves.fastLinearToSlowEaseIn,
        child: FailAlert(),
      );
    },
  );
}
