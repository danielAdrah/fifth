// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/primary_button.dart';
import '../../../common/rounded_textField.dart';
import '../../../theme.dart';
import 'custom_arc.dart';
import 'goal_item.dart';

class GoalDetail extends StatefulWidget {
  const GoalDetail({super.key});

  @override
  State<GoalDetail> createState() => _GoalDetailState();
}

class _GoalDetailState extends State<GoalDetail> {
  final TextEditingController balance = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: FadeInLeft(
          delay: Duration(milliseconds: 100),
          curve: Curves.decelerate,
          child: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: TColor.gray40,
              )),
        ),
      ),
      backgroundColor: TColor.gray,
      body: SafeArea(
        child: SingleChildScrollView(
          child: FadeInDown(
            delay: Duration(milliseconds: 100),
            curve: Curves.decelerate,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: width * 0.3, vertical: height * 0.1),
                  child: SizedBox(
                      height: height * 0.05,
                      width: width * 0.9,
                      child: CustomPaint(
                        painter: CustomArcPainter180(
                          arcs: [
                            ArcModel(color: TColor.secondaryG, value: 30),
                            ArcModel(color: TColor.secondary, value: 50),
                            ArcModel(color: TColor.primary10, value: 70),
                          ],
                        ),
                      )),
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
                  title: "The Goal",
                  value: "New Car",
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
                  title: "The Budget",
                  value: " \$95000",
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
                  title: " Current Balance",
                  value: " \$50000",
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
                  title: "Dead Line",
                  value: "2/2/2024",
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  child: Divider(
                      color: TColor.gray50,
                      indent: 20,
                      endIndent: 20,
                      thickness: 1),
                ),
                SizedBox(height: 15),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.2),
                  child: RoundedTextField(
                    titleAlign: TextAlign.center,
                    icon: Icon(Icons.wysiwyg_rounded),
                    title: 'Add To Goal Balance',
                    onIconPressed: () {},
                    controller: balance,
                    keyboardType: TextInputType.number,
                    obscureText: false,
                  ),
                ),
                SizedBox(height: 30),
                ZoomIn(
                  delay: Duration(milliseconds: 100),
                  curve: Curves.decelerate,
                  child: PrimaryButton(
                    onPressed: () {},
                    title: "Add To Balance",
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
