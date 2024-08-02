// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:animate_do/animate_do.dart';
import 'package:fifth/controller/expense_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dropdown_search/dropdown_search.dart';

import '../../../common/date_text_field.dart';
import '../../../common/primary_button.dart';
import '../../../common/rounded_textField.dart';
import '../../../common/rounded_text_area.dart';
import '../../../controller/limit_controller.dart';
import '../../../model/categories_model.dart';
import '../../../theme.dart';

// import 'package:awesome_dialog/awesome_dialog.dart';

class UpdateLimit extends StatefulWidget {
  UpdateLimit({super.key, required this.id});
  int id;

  @override
  State<UpdateLimit> createState() => _UpdateLimitState();
}

class _UpdateLimitState extends State<UpdateLimit> {
  // final TextEditingController limitName = TextEditingController();
  final controller = Get.put(LimitController());
  final controller1 = Get.put(ExpenseController());
  void clearField() {
    controller.newamount.clear();
    controller.newstartDate.clear();
    controller.newendDate.clear();
  }

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
                    " Update Limit  ",
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
                        FutureBuilder<List<CategoryModel>>(
                          future: controller1.fetchCategory(),
                          builder: (BuildContext context,
                              AsyncSnapshot<List<CategoryModel>> snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
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
                                    () => controller.updatedLimitCategory.value
                                            .isNotEmpty
                                        ? Text(
                                            controller.limitCategoryMap[
                                                    controller
                                                        .updatedLimitCategory
                                                        .value] ??
                                                "Select a category",
                                            style: TextStyle(
                                                color: TColor.white
                                                    .withOpacity(0.4)))
                                        : Text("Select a category",
                                            style: TextStyle(
                                                color: TColor.white
                                                    .withOpacity(0.4))),
                                  ),
                                  items: snapshot.data!
                                      .map((CategoryModel category) {
                                    return DropdownMenuItem<String>(
                                      value: category.id.toString(),
                                      child: Row(
                                        children: [
                                          Text(
                                            category.name,
                                            style:
                                                TextStyle(color: TColor.white),
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
                                      controller.updatedLimitCategory.value =
                                          val;
                                      // controller.fetchSubcategory();
                                    }
                                  }, //o Implement your logic here when a selection changes
                                ),
                              );
                            }
                          },
                        ),
                        Padding(
                          padding: EdgeInsets.all(media.width * 0.06),
                          child: RoundedTextField(
                            title: "The Amount",
                            controller: controller.newamount,
                            icon: Icon(Icons.near_me),
                            onIconPressed: () {},
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(media.width * 0.06),
                          child: DateTextField(
                            onTap: showDate,
                            title: "Start Date",
                            controller: controller.newstartDate,
                            keyboardType: TextInputType.number,
                            icon: Icon(
                              Icons.date_range,
                              color: TColor.primary,
                            ),
                            onIconPressed: () {},
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: media.width * 0.06,
                              right: media.width * 0.06,
                              top: media.width * 0.06),
                          child: DateTextField(
                            onTap: showDate2,
                            title: "End Date",
                            controller: controller.newendDate,
                            keyboardType: TextInputType.number,
                            icon: Icon(
                              Icons.date_range,
                              color: TColor.primary,
                            ),
                            onIconPressed: () {},
                          ),
                        ),
                        const SizedBox(height: 50),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: PrimaryButton(
                              title: "Update",
                              onPressed: () {
                                controller.updateLimit(widget.id);
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
      controller.newstartDate.text = picked.toString().substring(0, 10);
    }
  }

  Future<void> showDate2() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(3000),
      barrierColor: TColor.gray30,
    );
    if (picked != null) {
      controller.newendDate.text = picked.toString().substring(0, 10);
    }
  }
}
