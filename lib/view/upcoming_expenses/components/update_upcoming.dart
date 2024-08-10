// ignore_for_file: prefer_const_constructors

import 'package:animate_do/animate_do.dart';
import 'package:fifth/controller/upcoming_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dropdown_search/dropdown_search.dart';

import '../../../common/date_text_field.dart';
import '../../../common/primary_button.dart';
import '../../../common/rounded_textField.dart';
import '../../../controller/expense_controller.dart';
import '../../../theme.dart';
import '../../../widgets/methods.dart';

// import 'package:awesome_dialog/awesome_dialog.dart';

class UpdateUpcoming extends StatefulWidget {
  UpdateUpcoming({super.key, required this.id});
  int id;

  @override
  State<UpdateUpcoming> createState() => _UpdateUpcomingState();
}

class _UpdateUpcomingState extends State<UpdateUpcoming> {
  DateTime date = DateTime.now();

  void clearField() {
    controller.newupcomeName.clear();
    controller.newupcomePrice.clear();
    controller.newupcomeDate.clear();
  }

  final controller = Get.put(UpcomingController());
  final controller1 = Get.put(ExpenseController());
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
                    "Update Upcoming Expense",
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
                                "New Category",
                                style: TextStyle(
                                    color: TColor.white.withOpacity(0.4),
                                    fontSize: 12),
                              ),
                            ),
                            categoryDropdown(),
                          ],
                        ),
                        SizedBox(height: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                " New Subcategory",
                                style: TextStyle(
                                    color: TColor.white.withOpacity(0.4),
                                    fontSize: 12),
                              ),
                            ),
                            Obx(() => controller1.subCategories.isEmpty
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
                                                .updatedSubcategoryUpcomingId
                                                .value
                                                .isNotEmpty
                                            ? Text(
                                                controller.upcomingCategoryMap[
                                                        controller
                                                            .updatedSubcategoryUpcomingId
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
                                        items: controller1.subCategories.value
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
                                            controller
                                                .updatedSubcategoryUpcomingId
                                                .value = val;
                                          }
                                        }),
                                  )),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: media.width * 0.06,
                              vertical: media.width * 0.04),
                          child: RoundedTextField(
                            title: "New Name",
                            controller: controller.newupcomeName,
                            icon: Icon(Icons.near_me),
                            onIconPressed: () {},
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: media.width * 0.06,
                              vertical: media.width * 0.04),
                          child: DateTextField(
                            onTap: showDate,
                            title: "New Date",
                            controller: controller.newupcomeDate,
                            icon: Icon(Icons.near_me),
                            onIconPressed: () {},
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: media.width * 0.06,
                              vertical: media.width * 0.04),
                          child: RoundedTextField(
                            title: "New Price",
                            controller: controller.newupcomePrice,
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
                                controller.updateUpcoming(widget.id);
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

  Future<void> showDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(3000),
      barrierColor: TColor.gray30,
    );
    if (picked != null) {
      controller.newupcomeDate.text = picked.toString().substring(0, 10);
    }
  }
}
