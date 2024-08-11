// ignore_for_file: prefer_const_constructors

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
// import 'package:get/get.dart';
import '../../common/nav_bar.dart';
import '../../common/settings_value.dart';
import '../../core/api/dio_consumer.dart';
import '../../theme.dart';
import '../../controller/user_controller.dart';
import '../summary/summary_view.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  UserController controller =
      Get.put(UserController(api: DioConsumer(dio: Dio())));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: TColor.gray,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(children: [
              NavBar(title: "Settings"),
              const SizedBox(height: 35),
              Column(
                children: [
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 70,
                        backgroundImage: AssetImage("assets/img/u1.png"),
                      ),
                      Positioned(
                        right: 10,
                        bottom: 1,
                        child: InkWell(
                          onTap: () {},
                          child: CircleAvatar(
                            backgroundColor: TColor.white,
                            radius: 20,
                            child: Icon(
                              Icons.camera_alt,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  //we will replace it with the value of the TextEditingController
                  //of the name textField on the login creen
                  Text(
                    "Ali Ahmad",
                    style: TextStyle(
                        color: TColor.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 4),
                  Text("ali@gmail.com",
                      style: TextStyle(
                          color: TColor.gray30,
                          fontSize: 14,
                          fontWeight: FontWeight.w500)),
                  const SizedBox(height: 20),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 15, bottom: 2, left: 10),
                            child: Text(
                              "Profile Information",
                              style: TextStyle(
                                  color: TColor.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          Container(
                            // height: media.width * 1,
                            padding: const EdgeInsets.only(
                                top: 10, left: 20, right: 20, bottom: 20),
                            child: Column(children: [
                              Container(
                                padding: const EdgeInsets.only(
                                    top: 15, right: 15, bottom: 15, left: 2.5),
                                decoration: BoxDecoration(
                                  color: TColor.gray40.withOpacity(0.4),
                                  borderRadius: BorderRadius.circular(24),
                                ),
                                child: Column(
                                  children: [
                                    SettingsValue(
                                      name: "Name",
                                      icon: Icons.person,
                                      child: Text(
                                        "Ali Ahmad",
                                        style: TextStyle(color: TColor.white),
                                      ),
                                      onTap2: () {
                                        controller.fetchUserInfo();
                                      },
                                    ),
                                    const SizedBox(height: 5),
                                    SettingsValue(
                                      name: "E-mail",
                                      icon: Icons.mail,
                                      child: Text(
                                        "ali@gmail.com",
                                        style: TextStyle(color: TColor.white),
                                      ),
                                      onTap2: () {},
                                    ),
                                    const SizedBox(height: 5),
                                    SettingsValue(
                                      name: "Password",
                                      icon: Icons.password,
                                      child: Text(
                                        "Change It",
                                        style: TextStyle(color: TColor.white),
                                      ),
                                      onTap2: () {},
                                    ),
                                    const SizedBox(height: 10),
                                    InkWell(
                                      onTap: () {},
                                      child: Container(
                                        padding: const EdgeInsets.only(
                                            top: 8,
                                            bottom: 8,
                                            right: 15,
                                            left: 15),
                                        decoration: BoxDecoration(
                                            color:
                                                TColor.gray30.withOpacity(0.2),
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            border: Border.all(
                                                color: TColor.border
                                                    .withOpacity(0.15))),
                                        child: Text(
                                          "Edit Profile",
                                          style: TextStyle(
                                              color: TColor.white,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ]),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 15, bottom: 2, left: 10),
                            child: Text(
                              "General",
                              style: TextStyle(
                                  color: TColor.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          Container(
                            // height: media.width * 1,
                            padding: const EdgeInsets.only(
                                top: 10, left: 20, right: 20, bottom: 20),
                            child: Column(children: [
                              Container(
                                padding: const EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                  color: TColor.gray40.withOpacity(0.4),
                                  borderRadius: BorderRadius.circular(24),
                                ),
                                child: Column(
                                  children: [
                                    SettingsValue(
                                      name: "Summary",
                                      icon: CupertinoIcons.chart_pie,
                                      child: Icon(
                                        Icons.arrow_forward_ios,
                                        color: TColor.white,
                                      ),
                                      onTap2: () {
                                        Get.to(SummaryView());
                                      },
                                    ),
                                    SizedBox(height: 5),
                                    SettingsValue(
                                      name: "Expenses",
                                      icon: CupertinoIcons.shopping_cart,
                                      child: Icon(
                                        Icons.arrow_forward_ios,
                                        color: TColor.white,
                                      ),
                                      onTap2: () {},
                                    ),
                                    SizedBox(height: 5),
                                    SettingsValue(
                                      name: "Currency",
                                      icon: CupertinoIcons.money_dollar_circle,
                                      child: Icon(
                                        Icons.arrow_forward_ios,
                                        color: TColor.white,
                                      ),
                                      onTap2: () {},
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 15, bottom: 2, left: 10),
                                    child: Text(
                                      "Account",
                                      style: TextStyle(
                                          color: TColor.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(15),
                                    decoration: BoxDecoration(
                                      color: TColor.gray40.withOpacity(0.4),
                                      borderRadius: BorderRadius.circular(24),
                                    ),
                                    child: Column(
                                      children: [
                                        SettingsValue(
                                          icon: Icons.person,
                                          name: "Switch to another account",
                                          onTap2: () {},
                                          child: Icon(
                                            Icons.arrow_forward_ios,
                                            color: TColor.white,
                                          ),
                                        ),
                                        SettingsValue(
                                          icon: Icons.delete,
                                          name: "Delete my accounts",
                                          onTap2: () {},
                                          child: Icon(
                                            Icons.arrow_forward_ios,
                                            color: TColor.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ]),
                          ),
                        ]),
                  ),
                ],
              ),
            ]),
          ),
        ));
  }
}
