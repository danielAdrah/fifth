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

class CreateIncome extends StatefulWidget {
  const CreateIncome({super.key});

  @override
  State<CreateIncome> createState() => _CreateIncomeState();
}

class _CreateIncomeState extends State<CreateIncome> {
  DateTime date = DateTime.now();

  void clearField() {
    controller.upcomeName.clear();
    controller.upcomePrice.clear();
    controller.upcomeDate.clear();
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
                    "Create Upcoming Expense",
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
                        // Padding(
                        //   padding: EdgeInsets.all(media.width * 0.06),
                        //   child: DropdownSearch<String>(
                        //     onChanged: (value) {
                        //       // controller.item = value;
                        //     },
                        //     popupProps: PopupProps.menu(
                        //       itemBuilder: (context, item, isSelected) {
                        //         IconData icon;
                        //         switch (item) {
                        //           case "Food":
                        //             icon = Icons.fastfood;
                        //             break;
                        //           case "Drinks":
                        //             icon = Icons.local_cafe;
                        //             break;
                        //           case "Entertainment":
                        //             icon = Icons.movie;
                        //             break;
                        //           case "Education":
                        //             icon = Icons.school;
                        //             break;
                        //           case "Other":
                        //             icon = Icons.more_horiz;
                        //             break;
                        //           default:
                        //             icon = Icons.help;
                        //         }
                        //         return Container(
                        //           padding: const EdgeInsets.all(5),
                        //           decoration: BoxDecoration(
                        //             color: isSelected
                        //                 ? TColor.gray50
                        //                 : Colors.transparent,
                        //           ),
                        //           child: ListTile(
                        //             title: Text(
                        //               item,
                        //               style: TextStyle(color: TColor.white),
                        //             ),
                        //             leading: Icon(
                        //               icon,
                        //               color: TColor.white,
                        //             ),
                        //           ),
                        //         );
                        //       },
                        //       menuProps: MenuProps(
                        //         backgroundColor: TColor.gray50,
                        //         borderRadius: BorderRadius.circular(25),
                        //       ),
                        //       showSelectedItems: true,
                        //     ),
                        //     items: items,
                        //     dropdownButtonProps: DropdownButtonProps(
                        //       color: TColor.border,
                        //     ),
                        //     dropdownDecoratorProps: DropDownDecoratorProps(
                        //       baseStyle: TextStyle(color: TColor.white),
                        //       dropdownSearchDecoration: InputDecoration(
                        //         label: Text(
                        //           "Choose A Type",
                        //           style: TextStyle(color: TColor.border),
                        //         ),
                        //         border: OutlineInputBorder(
                        //             borderRadius: BorderRadius.circular(18)),
                        //       ),
                        //     ),
                        //   ),
                        // ),
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
                        SizedBox(height: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Subcategory",
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
                                                .subcategoryUpcomingId
                                                .value
                                                .isNotEmpty
                                            ? Text(
                                                controller.upcomingCategoryMap[
                                                        controller
                                                            .subcategoryUpcomingId
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
                                            controller.subcategoryUpcomingId
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
                            title: "Name",
                            controller: controller.upcomeName,
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
                            title: "Date",
                            controller: controller.upcomeDate,
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
                            title: "Price",
                            controller: controller.upcomePrice,
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
                                controller.createUpcoming();
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
      controller.upcomeDate.text = picked.toString().substring(0, 10);
    }
  }
}
