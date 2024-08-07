// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dropdown_search/dropdown_search.dart';

import '../../../common/date_text_field.dart';
import '../../../common/primary_button.dart';
import '../../../common/rounded_textField.dart';
import '../../../common/rounded_text_area.dart';
import '../../../theme.dart';

// import 'package:awesome_dialog/awesome_dialog.dart';

class CreateGoal extends StatefulWidget {
  const CreateGoal({super.key});

  @override
  State<CreateGoal> createState() => _CreateGoalState();
}

class _CreateGoalState extends State<CreateGoal> {
  final TextEditingController goalName = TextEditingController();
  final TextEditingController budget = TextEditingController();
  final TextEditingController date = TextEditingController();
  final TextEditingController notes = TextEditingController();

  void clearField() {}

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
                    " Create Goal  ",
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
                          padding: EdgeInsets.all(media.width * 0.03),
                          child: RoundedTextField(
                            title: "Name",
                            controller: goalName,
                            icon: Icon(Icons.near_me),
                            onIconPressed: () {},
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(media.width * 0.03),
                          child: RoundedTextField(
                            title: "Budget",
                            controller: budget,
                            icon: Icon(Icons.near_me),
                            onIconPressed: () {},
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(media.width * 0.03),
                          child: DateTextField(
                            onTap: showDate,
                            title: "Date",
                            controller: date,
                            keyboardType: TextInputType.number,
                            icon: Icon(
                              Icons.date_range,
                              color: TColor.primary,
                            ),
                            onIconPressed: () {},
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(media.width * 0.03),
                          child: RoundedTextArea(
                            length: 3,
                            icon: Icon(Icons.money),
                            onIconPressed: () {},
                            title: "Notes",
                            controller: notes,
                            keyboardType: TextInputType.name,
                            obscureText: false,
                          ),
                        ),
                        const SizedBox(height: 50),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: PrimaryButton(
                              title: "Add",
                              onPressed: () {
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
      date.text = picked.toString().substring(0, 10);
    }
  }
}
