// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/custome_app_bar.dart';
import '../../theme.dart';
import 'component/goal_card.dart';
import 'component/goal_detail.dart';

class GoalView extends StatefulWidget {
  const GoalView({super.key});

  @override
  State<GoalView> createState() => _GoalViewState();
}

class _GoalViewState extends State<GoalView> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: TColor.gray,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomeAppBar(title: "My Goals"),
              SizedBox(height: height * 0.07),
              SizedBox(
                height: height,
                child: ListView.builder(
                    // physics: NeverScrollableScrollPhysics(),
                    itemCount: 10,
                    itemBuilder: ((context, index) {
                      return GoalCard(
                        width: width,
                        height: height,
                        goalName: "New Car",
                        current: "25000",
                        finalBalance: "900000",
                        date: "2/2/2024",
                        onTap: () {
                          Get.to(GoalDetail());
                        },
                      );
                    })),
              ),
              // SizedBox(height: 60),
            ],
          ),
        ),
      ),
    );
  }
}
