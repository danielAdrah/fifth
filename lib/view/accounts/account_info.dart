// ignore_for_file: prefer_const_constructors, unused_local_variable

import 'package:dio/dio.dart';
import 'package:fifth/controller/user_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import "package:animate_do/animate_do.dart";
import '../../common/primary_button.dart';
import '../../common/rounded_textField.dart';
import '../../common/rounded_text_area.dart';
import '../../common/secondary_button.dart';
import '../../controller/user_controller.dart';
import '../../core/api/dio_consumer.dart';
import '../../theme.dart';
import '../mainNavBar/main_navbar.dart';
import '../signUp&logIn/sign_in_view.dart';

class CreatAccount extends StatefulWidget {
  const CreatAccount({super.key});

  @override
  State<CreatAccount> createState() => _CreatAccountState();
}

class _CreatAccountState extends State<CreatAccount> {
  final controller = Get.put(UserController(api: DioConsumer(dio: Dio())));

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(
        init: Get.find<UserController>(),
        builder: (controller) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (controller.userState is AccountSuccess) {
              Get.offAll(const MainNavBar());
            }
            if (controller.userState is AccountFail) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Try again"),
                ),
              );
            }
          });
          return Scaffold(
            backgroundColor: TColor.gray80,
            body: SafeArea(
                child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              child: SingleChildScrollView(
                child: FadeInUp(
                  delay: Duration(milliseconds: 500),
                  curve: Curves.decelerate,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 50),
                      Text(
                        "What is in your mind for  this account?!",
                        style: TextStyle(
                            color: TColor.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 40),
                      RoundedTextField(
                        title: "Account Name",
                        controller: controller.accountName,
                        icon: Icon(
                          Icons.person,
                          color: TColor.gray30,
                        ),
                        onIconPressed: () {},
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      RoundedTextField(
                        title: "Currency",
                        keyboardType: TextInputType.name,
                        controller: controller.accountCurrency,
                        icon: Icon(
                          Icons.attach_money_outlined,
                          color: TColor.gray30,
                        ),
                        onIconPressed: () {},
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      RoundedTextField(
                        title: "Budget",
                        controller: controller.accountBudget,
                        keyboardType: TextInputType.number,
                        icon: Icon(
                          CupertinoIcons.bitcoin_circle,
                          color: TColor.gray30,
                        ),
                        onIconPressed: () {},
                      ),
                      const SizedBox(height: 20),
                      RoundedTextArea(
                        length: 10,
                        title: "Note",
                        controller: controller.accountNote,
                        icon: Icon(
                          Icons.add,
                          color: TColor.gray60.withOpacity(0.8),
                        ),
                        onIconPressed: () {},
                      ),
                      SizedBox(height: 80),
                      controller.userState is AccountLoading
                          ? SpinKitSpinningLines(
                              color: TColor.primary,
                              size: 40,
                            )
                          : PrimaryButton(
                              title: "Confirm",
                              onPressed: () {
                                // controller.createAccount();
                                
                                Get.to(MainNavBar());
                              }),
                    ],
                  ),
                ),
              ),
            )),
          );
        });
  }
}
