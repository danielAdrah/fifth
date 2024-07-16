// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/custome_app_bar.dart';
import '../../theme.dart';
import '../settings/settings_view.dart';

class ChartView extends StatefulWidget {
  const ChartView({super.key});

  @override
  State<ChartView> createState() => _ChartViewState();
}

class _ChartViewState extends State<ChartView> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: TColor.gray,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomeAppBar(
                title: "Charts",
              ),
              SizedBox(height: media.width * 0.15),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: media.width * 0.07),
                    child: Text(
                      "Line Chart",
                      style: TextStyle(color: TColor.gray30),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: media.width * 0.015,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: media.width * 0.025),
                height: media.width * 0.75,
                decoration: BoxDecoration(
                  color: TColor.gray70.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    //here will put the line chart wodget
                    SizedBox(height: 100),
                    Center(
                      child: Text(
                        "Line Chart",
                        style: TextStyle(color: TColor.white),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: media.width * 0.09),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: media.width * 0.07),
                    child: Text(
                      "Bar Chart",
                      style: TextStyle(color: TColor.gray30),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: media.width * 0.015,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: media.width * 0.025),
                height: media.width * 0.75,
                decoration: BoxDecoration(
                  color: TColor.gray70.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    //here will put the Bar chart wodget
                    SizedBox(height: 100),
                    Center(
                      child: Text(
                        "Bar Chart",
                        style: TextStyle(color: TColor.white),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}
