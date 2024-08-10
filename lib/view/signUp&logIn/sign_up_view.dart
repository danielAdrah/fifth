// ignore_for_file: prefer_const_constructors

import 'package:dio/dio.dart';
import 'package:fifth/controller/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import "package:animate_do/animate_do.dart";
import '../../common/primary_button.dart';
import '../../common/rounded_textField.dart';
import '../../common/secondary_button.dart';
import '../../controller/user_controller.dart';
import '../../core/api/dio_consumer.dart';
import '../../theme.dart';
 import 'sign_in_view.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    bool isScure = false;
    final FocusNode myNode = FocusNode();
    var media = MediaQuery.of(context).size;
    final controller = Get.put(UserController(api: DioConsumer(dio: Dio())));

    return GetBuilder(
        init: Get.find<UserController>(),
        builder: ((controller) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (controller.userState is SignUpSuccess) {
              Get.to(Signin());
              // ScaffoldMessenger.of(context).showSnackBar(
              //   const SnackBar(
              //     content: Text("Sign Up done successfully"),
              //   ),
              // );
            }
            if (controller.userState is SignUpFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                      "the error : ${(controller.userState as SignUpFailure).errMessage}"),
                ),
              );
            }
          });
          return Scaffold(
            backgroundColor: TColor.gray80,
            body: SafeArea(
                child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: ListView(
                      children: [
                        SizedBox(height: 80),
                        // const Spacer(),
                        FadeInDown(
                          delay: const Duration(milliseconds: 500),
                          child: RoundedTextField(
                            title: "Name",
                            controller: controller.txtName,
                            icon: Icon(
                              Icons.person,
                              color: TColor.gray30,
                            ),
                            onIconPressed: () {},
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        FadeInLeft(
                          delay: const Duration(milliseconds: 500),
                          child: RoundedTextField(
                            title: "E-mail Address",
                            keyboardType: TextInputType.emailAddress,
                            controller: controller.txtEmail,
                            icon: Icon(
                              Icons.mail,
                              color: TColor.gray30,
                            ),
                            onIconPressed: () {},
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Obx(
                          () => FadeInRight(
                            delay: const Duration(milliseconds: 500),
                            child: RoundedTextField(
                              title: "Password",
                              obscureText: controller.secure.value,
                              controller: controller.txtPassword,
                              icon: Icon(
                                controller.secure.value
                                    ? Icons.lock
                                    : Icons.lock_open,
                                color: TColor.gray30,
                              ),
                              onIconPressed: () {
                                controller.secure.value =
                                    !controller.secure.value;
                              },
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Obx(
                          () => FadeInUp(
                            delay: const Duration(milliseconds: 500),
                            child: RoundedTextField(
                              title: "ConfirmPassword",
                              obscureText: controller.cSecure.value,
                              controller: controller.txtConfPass,
                              icon: Icon(
                                controller.cSecure.value
                                    ? Icons.lock
                                    : Icons.lock_open,
                                color: TColor.gray30,
                              ),
                              onIconPressed: () {
                                controller.cSecure.value =
                                    !controller.cSecure.value;
                              },
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 5,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 2),
                                decoration: BoxDecoration(
                                  color: TColor.gray70,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                height: 5,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 2),
                                decoration: BoxDecoration(
                                  color: TColor.gray70,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                height: 5,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 2),
                                decoration: BoxDecoration(
                                  color: TColor.gray70,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                height: 5,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 2),
                                decoration: BoxDecoration(
                                  color: TColor.gray70,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "use complex password to better protection",
                              style: TextStyle(
                                color: TColor.gray50,
                                fontSize: 11,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        controller.userState is SignUpLoading
                            ? CircularProgressIndicator()
                            : FadeInRightBig(
                                delay: const Duration(milliseconds: 500),
                                child: PrimaryButton(
                                    title: "Get Started, It's Free",
                                    onPressed: () {
                                      controller.SignUp();
                                    }),
                              ),

                        const SizedBox(height: 25),
                        Text(
                          "Do You Have An Account?",
                          style: TextStyle(
                            color: TColor.white,
                            fontSize: 14,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        FadeInLeftBig(
                          delay: const Duration(milliseconds: 500),
                          child: SecondaryButton(
                              title: "SignIn",
                              onPressed: () {
                                Get.to(() => Signin());
                              }),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          "By registering you agree with our terms of use",
                          style: TextStyle(
                            color: TColor.white,
                            fontSize: 14,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )),
          );
        }));
  }
}
