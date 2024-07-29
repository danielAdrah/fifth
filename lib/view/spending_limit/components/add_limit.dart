// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dropdown_search/dropdown_search.dart';

import '../../../common/date_text_field.dart';
import '../../../common/primary_button.dart';
import '../../../common/rounded_textField.dart';
import '../../../common/rounded_text_area.dart';
import '../../../controller/limit_controller.dart';
import '../../../theme.dart';

// import 'package:awesome_dialog/awesome_dialog.dart';

class CreateLimit extends StatefulWidget {
  const CreateLimit({super.key});

  @override
  State<CreateLimit> createState() => _CreateGoalState();
}

class _CreateGoalState extends State<CreateLimit> {
  // final TextEditingController limitName = TextEditingController();
  final controller = Get.put(LimitController());
  void clearField() {}
  List<String> items = [
    "Food",
    "Drinks",
    "Entertainment",
    "Education",
    "Other"
  ];

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
                    " Create Limit  ",
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
                        Padding(
                          padding: EdgeInsets.all(media.width * 0.06),
                          child: DropdownSearch<String>(
                            onChanged: (value) {
                              // controller.item = value;
                            },
                            popupProps: PopupProps.menu(
                              itemBuilder: (context, item, isSelected) {
                                IconData icon;
                                switch (item) {
                                  case "Food":
                                    icon = Icons.fastfood;
                                    break;
                                  case "Drinks":
                                    icon = Icons.local_cafe;
                                    break;
                                  case "Entertainment":
                                    icon = Icons.movie;
                                    break;
                                  case "Education":
                                    icon = Icons.school;
                                    break;
                                  case "Other":
                                    icon = Icons.more_horiz;
                                    break;
                                  default:
                                    icon = Icons.help;
                                }
                                return Container(
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    color: isSelected
                                        ? TColor.gray50
                                        : Colors.transparent,
                                  ),
                                  child: ListTile(
                                    title: Text(
                                      item,
                                      style: TextStyle(color: TColor.white),
                                    ),
                                    leading: Icon(
                                      icon,
                                      color: TColor.white,
                                    ),
                                  ),
                                );
                              },
                              menuProps: MenuProps(
                                backgroundColor: TColor.gray50,
                                borderRadius: BorderRadius.circular(25),
                              ),
                              showSelectedItems: true,
                            ),
                            items: items,
                            dropdownButtonProps: DropdownButtonProps(
                              color: TColor.border,
                            ),
                            dropdownDecoratorProps: DropDownDecoratorProps(
                              baseStyle: TextStyle(color: TColor.white),
                              dropdownSearchDecoration: InputDecoration(
                                label: Text(
                                  "Choose A Category",
                                  style: TextStyle(color: TColor.border),
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(18)),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(media.width * 0.06),
                          child: DropdownSearch<String>(
                            onChanged: (value) {
                              // controller.item = value;
                            },
                            popupProps: PopupProps.menu(
                              itemBuilder: (context, item, isSelected) {
                                IconData icon;
                                switch (item) {
                                  case "Food":
                                    icon = Icons.fastfood;
                                    break;
                                  case "Drinks":
                                    icon = Icons.local_cafe;
                                    break;
                                  case "Entertainment":
                                    icon = Icons.movie;
                                    break;
                                  case "Education":
                                    icon = Icons.school;
                                    break;
                                  case "Other":
                                    icon = Icons.more_horiz;
                                    break;
                                  default:
                                    icon = Icons.help;
                                }
                                return Container(
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    color: isSelected
                                        ? TColor.gray50
                                        : Colors.transparent,
                                  ),
                                  child: ListTile(
                                    title: Text(
                                      item,
                                      style: TextStyle(color: TColor.white),
                                    ),
                                    leading: Icon(
                                      icon,
                                      color: TColor.white,
                                    ),
                                  ),
                                );
                              },
                              menuProps: MenuProps(
                                backgroundColor: TColor.gray50,
                                borderRadius: BorderRadius.circular(25),
                              ),
                              showSelectedItems: true,
                            ),
                            items: [
                              "Syrian Bound",
                              "Dollar",
                            ],
                            dropdownButtonProps: DropdownButtonProps(
                              color: TColor.border,
                            ),
                            dropdownDecoratorProps: DropDownDecoratorProps(
                              baseStyle: TextStyle(color: TColor.white),
                              dropdownSearchDecoration: InputDecoration(
                                label: Text(
                                  "Choose A Currency",
                                  style: TextStyle(color: TColor.border),
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(18)),
                              ),
                            ),
                          ),
                        ),
                        
                        Padding(
                          padding: EdgeInsets.all(media.width * 0.06),
                          child: RoundedTextField(
                            title: "The Amount",
                            controller: controller.amount,
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
                            controller: controller.startDate,
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
                            controller: controller.endDate,
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
                              title: "Add",
                              onPressed: () {
                                controller.createLimit();
                                clearField();

                                Get.back();
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
      controller.startDate.text = picked.toString().substring(0, 10);
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
      controller.endDate.text = picked.toString().substring(0, 10);
    }
  }
}
