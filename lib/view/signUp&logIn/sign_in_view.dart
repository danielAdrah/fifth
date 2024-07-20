import 'package:dio/dio.dart';
import 'package:fifth/controller/user_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/user_controller.dart';
import '../../common/primary_button.dart';
import '../../common/rounded_textField.dart';
import '../../common/secondary_button.dart';
import '../../core/api/dio_consumer.dart';
import '../../theme.dart';
import '../bottom_bar/bottom_bar_view.dart';
import '../mainNavBar/main_navbar.dart';
import 'sign_up_view.dart';
import "package:animate_do/animate_do.dart";

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  // TextEditingController signIntxtEmail = TextEditingController();
  // TextEditingController signIntxtPassword = TextEditingController();
  bool isRemembered = false;
  bool isLoading = false;
  bool isScure = true;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController(api: DioConsumer(dio: Dio())));
    return GetBuilder<UserController>(
        init: Get.find<UserController>(),
        builder: (controller) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            // if (controller.userState is SignInSuccess) {
            //   Get.offAll(const MainNavBar());
            // }
            if (controller.userState is SignInFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                      "the error : ${(controller.userState as SignInFailure).errMessage}"),
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
                  const Spacer(),
                  FadeInDown(
                    delay: const Duration(milliseconds: 500),
                    curve: Curves.decelerate,
                    child: RoundedTextField(
                      title: "E-mail",
                      keyboardType: TextInputType.emailAddress,
                      controller: controller.signIntxtEmail,
                      icon: Icon(
                        Icons.mail,
                        color: TColor.gray30,
                      ),
                      onIconPressed: () {},
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Obx(
                    () => FadeInDown(
                      // curve: Curves.bounceInOut,
                      delay: const Duration(milliseconds: 500),
                      curve: Curves.decelerate,
                      child: RoundedTextField(
                        title: "Password",
                        controller: controller.signIntxtPassword,
                        obscureText: controller.signInSecure.value,
                        icon: Icon(
                          controller.signInSecure.value
                              ? Icons.lock
                              : Icons.lock_open,
                          color: TColor.gray30,
                        ),
                        onIconPressed: () {
                          controller.signInSecure.value =
                              !controller.signInSecure.value;
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  FadeInDown(
                    delay: Duration(milliseconds: 550),
                    curve: Curves.decelerate,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {
                            setState(() {
                              isRemembered = !isRemembered;
                            });
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                isRemembered
                                    ? Icons.check_box_rounded
                                    : Icons.check_box_outline_blank_rounded,
                                size: 20,
                                color: TColor.gray50,
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Text(
                                "Remember Me",
                                style: TextStyle(
                                  color: TColor.gray50,
                                  fontSize: 11,
                                ),
                              ),
                            ],
                          ),
                        ),
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              "Forget Password",
                              style: TextStyle(
                                color: TColor.gray50,
                                fontSize: 11,
                              ),
                            ))
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  // isLoading
                  //     ? CircularProgressIndicator()
                  //     :
                  controller.userState is SignInLoading
                      ? CircularProgressIndicator()
                      : FadeInDown(
                          delay: const Duration(milliseconds: 600),
                          curve: Curves.decelerate,
                          child: PrimaryButton(
                              title: "Sign In",
                              onPressed: () async {
                                controller.singIn();

                                // setState(() {
                                //   isLoading = true;
                                // });
                                // try {
                                //   final response = await controller.singIn();
                                //   if (response is String) {
                                //     ScaffoldMessenger.of(context).showSnackBar(
                                //       SnackBar(
                                //           content:
                                //               Text("failed because : $response")),
                                //     );
                                //   } else {
                                //     ScaffoldMessenger.of(context).showSnackBar(
                                //       const SnackBar(
                                //           content: Text('Sign in successful')),
                                //     );
                                //   }
                                // } catch (e) {
                                //   ScaffoldMessenger.of(context).showSnackBar(
                                //     SnackBar(content: Text('Sign in failed: $e')),
                                //   );
                                // } finally {
                                //   setState(() {
                                //     isLoading = false;
                                //   });
                                // }
                              }),
                        ),
                  const Spacer(),
                  FadeInDown(
                    delay: Duration(milliseconds: 600),
                    curve: Curves.decelerate,
                    child: Text(
                      "If you don't have an account yet",
                      style: TextStyle(
                        color: TColor.white,
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  FadeInDown(
                    delay: const Duration(milliseconds: 600),
                    curve: Curves.decelerate,
                    child: SecondaryButton(
                        title: "SignUp",
                        onPressed: () {
                          Get.to(() => SignUp());
                        }),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  FadeInDown(
                    delay: const Duration(milliseconds: 600),
                    curve: Curves.decelerate,
                    child: Text(
                      "By registering you agree with our terms of use",
                      style: TextStyle(
                        color: TColor.white,
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            )),
          );
        });
  }
}
