// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

import '../../model/pie_chart_model.dart';
import '../../theme.dart';
import 'components/piechart.dart';

class SummaryView extends StatefulWidget {
  const SummaryView({super.key});

  @override
  State<SummaryView> createState() => _SummaryViewState();
}

class _SummaryViewState extends State<SummaryView> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: TColor.gray,
      appBar: AppBar(
        iconTheme: IconThemeData(color: TColor.white),
        title: Text(
          "Summary",
          style: TextStyle(color: TColor.white, fontSize: 22),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 30),
              Text(
                "Here you will find more analysis for your spendings",
                style: TextStyle(
                    color: TColor.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 50),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 40, vertical: 5),
                    child: Text(
                      "Transport",
                      style: TextStyle(
                          color: TColor.border,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    padding: EdgeInsets.symmetric(vertical: 10),
                    // height: media.width * 0.8,
                    decoration: BoxDecoration(
                      color: TColor.gray50.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: SizedBox(
                      child: SubPieChart(
                        pieChartData: [
                          PieChartData("Taxi", 32),
                          PieChartData(" Train", 30),
                          PieChartData("Bus", 45),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 40, vertical: 5),
                    child: Text(
                      "Food",
                      style: TextStyle(
                          color: TColor.border,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    padding: EdgeInsets.symmetric(vertical: 10),
                    // height: media.width * 0.8,
                    decoration: BoxDecoration(
                      color: TColor.gray50.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: SizedBox(
                      child: SubPieChart(
                        pieChartData: [
                          PieChartData("Fast Food", 40),
                          PieChartData(" Grocery", 70),
                          PieChartData("Sweets", 25),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 40, vertical: 5),
                    child: Text(
                      "Home & Applainces",
                      style: TextStyle(
                          color: TColor.border,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    padding: EdgeInsets.symmetric(vertical: 10),
                    // height: media.width * 0.8,
                    decoration: BoxDecoration(
                      color: TColor.gray50.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: SizedBox(
                      child: SubPieChart(
                        pieChartData: [
                          PieChartData("House Fixing", 40),
                          PieChartData(" Furniture", 70),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
