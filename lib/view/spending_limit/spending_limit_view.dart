// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../theme.dart';
import 'components/add_limit.dart';
import 'components/limit_tile.dart';

class SpendingLimit extends StatefulWidget {
  const SpendingLimit({super.key});

  @override
  State<SpendingLimit> createState() => _SpendingLimitState();
}

class _SpendingLimitState extends State<SpendingLimit> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: TColor.gray,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: FadeInDown(
            delay: Duration(milliseconds: 150),
            curve: Curves.decelerate,
            child:
                Text("Spending Limits", style: TextStyle(color: TColor.white))),
        actions: [
          FadeInRight(
            delay: Duration(milliseconds: 150),
            curve: Curves.decelerate,
            child: IconButton(
              onPressed: () {
                Get.to(CreateLimit());
              },
              icon: Icon(
                Icons.add,
                color: TColor.white,
                size: 33,
              ),
            ),
          ),
        ],
        leading: FadeInLeft(
          delay: Duration(milliseconds: 150),
          curve: Curves.decelerate,
          child: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: TColor.white,
              size: 25,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 10),
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: 10,
            itemBuilder: ((context, index) {
              return FadeInUp(
                delay: Duration(milliseconds: 150),
                curve: Curves.decelerate,
                child: LimitTile(
                  limitName: "Name",
                  totalAmount: "10000",
                  spendAmount: "4500",
                  remainedAmount: "5500",
                  startDate: "2/2/2024",
                  endDate: "2/2/2026",
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
