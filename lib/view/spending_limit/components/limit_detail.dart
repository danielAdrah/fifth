// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_string_interpolations

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../common/primary_button.dart';
import '../../../common/rounded_textField.dart';
import '../../../controller/limit_controller.dart';
import '../../../theme.dart';
import '../../goals/component/goal_item.dart';

class LimitDetail extends StatefulWidget {
  const LimitDetail({super.key});

  @override
  State<LimitDetail> createState() => _LimitDetailState();
}

class _LimitDetailState extends State<LimitDetail> {
  final controller = Get.put(LimitController());
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: FadeInDown(
          delay: Duration(milliseconds: 150),
          curve: Curves.decelerate,
          child: Text("Limit Detail",
              style: TextStyle(
                  color: TColor.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        leading: FadeInLeft(
          delay: Duration(milliseconds: 100),
          curve: Curves.decelerate,
          child: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.arrow_back,
                color: TColor.white,
              )),
        ),
      ),
      backgroundColor: TColor.gray,
      body: SafeArea(
        child: Obx(() => SingleChildScrollView(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    right: media.width * 0.055,
                    left: media.width * 0.055,
                    top: media.width * 0.05),
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  height: 600,
                  decoration: BoxDecoration(
                      color: TColor.gray70.withOpacity(0.8),
                      border: Border.all(color: TColor.border.withOpacity(0.3)),
                      borderRadius: BorderRadius.circular(25)),
                  child: FadeInDown(
                    delay: Duration(milliseconds: 150),
                    curve: Curves.decelerate,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 70),
                        GoalItem(
                          width: width,
                          title: "The limit Category",
                          value: "${controller.oneLimit.value.categoryName}",
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 18),
                          child: Divider(
                              color: TColor.gray50,
                              indent: 20,
                              endIndent: 20,
                              thickness: 1),
                        ),
                        GoalItem(
                          width: width,
                          title: "The limit balance",
                          value: " \$${controller.oneLimit.value.limit}",
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 18),
                          child: Divider(
                              color: TColor.gray50,
                              indent: 20,
                              endIndent: 20,
                              thickness: 1),
                        ),
                        GoalItem(
                          width: width,
                          title: " spending amount",
                          value: " \$${controller.oneLimit.value.currentSpending}",
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 18),
                          child: Divider(
                              color: TColor.gray50,
                              indent: 20,
                              endIndent: 20,
                              thickness: 1),
                        ),
                        GoalItem(
                          width: width,
                          title: "Remaining amount",
                          value: "\$${controller.oneLimit.value.remainingAmount}",
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 18),
                          child: Divider(
                              color: TColor.gray50,
                              indent: 20,
                              endIndent: 20,
                              thickness: 1),
                        ),
                        GoalItem(
                          width: width,
                          title: "Start date",
                          value:
                              "${controller.oneLimit.value.startDate.toString().substring(0, 11)}",
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 18),
                          child: Divider(
                              color: TColor.gray50,
                              indent: 20,
                              endIndent: 20,
                              thickness: 1),
                        ),
                        GoalItem(
                          width: width,
                          title: "End date",
                          value:
                              "${controller.oneLimit.value.endDate.toString().substring(0, 11)}",
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),)
      ),
    );
  }
}
