// ignore_for_file: prefer_const_constructors

import 'dart:ffi';
import 'dart:io';

import 'package:animate_do/animate_do.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
// import 'package:get/get.dart';
import '../../common/nav_bar.dart';
import '../../common/settings_value.dart';
import '../../controller/expense_controller.dart';
import '../../core/api/dio_consumer.dart';
import '../../theme.dart';
import '../../controller/user_controller.dart';
import '../accounts/accounts_view.dart';
import '../summary/summary_view.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  final cont = Get.put(ExpenseController());
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
              FadeInDown(
                delay: Duration(milliseconds: 200),
                curve: Curves.decelerate,
                child: Column(
                  children: [
                    Obx(
                      () => Stack(
                        children: [
                          CircleAvatar(
                              radius: 70,
                              backgroundImage: controller.imagePath.value ==
                                      null
                                  ? AssetImage("assets/img/u1.png")
                                  : FileImage(File(controller.imagePath.value!))
                                      as ImageProvider<Object>?),
                          Positioned(
                            right: 10,
                            bottom: 1,
                            child: InkWell(
                              onTap: () {
                                //choose a pic
                                controller.uploadImage();
                              },
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
                    ),
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
                                        top: 15,
                                        right: 15,
                                        bottom: 15,
                                        left: 2.5),
                                    decoration: BoxDecoration(
                                      color: TColor.gray40.withOpacity(0.4),
                                      borderRadius: BorderRadius.circular(24),
                                    ),
                                    child: Obx(
                                      () => Column(
                                        children: [
                                          SettingsValue(
                                            name: "Name",
                                            icon: Icons.person,
                                            child: Text(
                                              "${controller.userProfile.value.username}",
                                              style: TextStyle(
                                                  color: TColor.white),
                                            ),
                                            onTap2: () {
                                              cont.subPiechart();
                                            },
                                          ),
                                          const SizedBox(height: 5),
                                          SettingsValue(
                                            name: "E-mail",
                                            icon: Icons.mail,
                                            child: Text(
                                              "${controller.userProfile.value.email}",
                                              style: TextStyle(
                                                  color: TColor.white),
                                            ),
                                            onTap2: () {},
                                          ),
                                          const SizedBox(height: 5),
                                          SettingsValue(
                                            name: "Password",
                                            icon: Icons.password,
                                            child: Text(
                                              "Change It",
                                              style: TextStyle(
                                                  color: TColor.white),
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
                                                  color: TColor.gray30
                                                      .withOpacity(0.2),
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
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )),
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
                                        name: "My Accounts",
                                        icon: CupertinoIcons.person_2_fill,
                                        child: Icon(
                                          Icons.arrow_forward_ios,
                                          color: TColor.white,
                                        ),
                                        onTap2: () {
                                          Get.to(AccountsView());
                                        },
                                      ),
                                      SizedBox(height: 5),
                                      SettingsValue(
                                        name: "Delete My Accounts",
                                        icon: Icons.delete,
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
                              ]),
                            ),
                          ]),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ));
  }
}
