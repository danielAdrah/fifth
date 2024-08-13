// ignore_for_file: sort_child_properties_last, prefer_const_constructors

import 'package:animate_do/animate_do.dart';
import 'package:animated_button/animated_button.dart';
import 'package:animated_icon/animated_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme.dart';

class FailAlert extends StatelessWidget {
  const FailAlert({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return AlertDialog(
      elevation: 5,
      shadowColor: TColor.border,
      backgroundColor: TColor.gray70,
      content: Container(
        width: width * 0.65,
        height: height * 0.23,
        child: ZoomIn(
          delay: Duration(milliseconds: 150),
          curve: Curves.fastLinearToSlowEaseIn,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 10),
              // Image.asset(
              //   "assets/img/correct.png",
              //   height: 80,
              //   width: 80,
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimateIcon(
                    onTap: () {},
                    // width: 100,
                    // height: 100,
                    iconType: IconType.continueAnimation,
                    color: Colors.red,
                    animateIcon: AnimateIcons.neutralFace,
                  ),
                  SizedBox(width: 4),
                  AnimateIcon(
                    onTap: () {},
                    // width: 100,
                    // height: 100,
                    iconType: IconType.continueAnimation,
                    color: Colors.red,
                    animateIcon: AnimateIcons.neutralFace,
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                "Something Went Wrong",
                style: TextStyle(
                    color: TColor.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: AnimatedButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: Text(
                    "Ok",
                    style: TextStyle(
                        color: TColor.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                  color: Colors.red,
                  height: 50,
                  shadowDegree: ShadowDegree.dark,
                ),
              )

              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: PrimaryButton(title: "Ok", onPressed: () {}),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
