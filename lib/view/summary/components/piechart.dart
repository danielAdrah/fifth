// ignore_for_file: prefer_for_elements_to_map_fromiterable, prefer_const_constructors

import 'package:flutter/material.dart';
// import 'package:get/get.dart';
import 'package:pie_chart/pie_chart.dart';
import '../../../model/pie_chart_model.dart';
import '../../../theme.dart';
import 'dart:math';

class SubPieChart extends StatefulWidget {
  SubPieChart({super.key, required this.pieChartData});
  List<PieChartData> pieChartData;

  @override
  State<SubPieChart> createState() => _SubPieChartState();
}

class _SubPieChartState extends State<SubPieChart> {
  @override
  Widget build(BuildContext context) {
    LinearGradient gradient = LinearGradient(
      colors: [Colors.red, Colors.blue],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );

    List<PieChartData> pieChartData = widget.pieChartData;
    final gradientList = <List<Color>>[
      [
        Color.fromARGB(255, 233, 8, 8),
        Color.fromARGB(255, 136, 104, 105),
      ],
      [
        Color.fromARGB(255, 161, 57, 209),
        Color.fromARGB(255, 228, 62, 192),
      ],
      [
        Color.fromARGB(255, 84, 82, 224),
        Color.fromARGB(255, 24, 140, 194),
      ]
    ];

    //  [
    //   PieChartData("Food", 32),
    //   PieChartData("Home & Applainces", 30),
    //   PieChartData("Transport", 45),
    //   PieChartData("Education", 35),
    //   PieChartData("Other", 60),
    // ];
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: PieChart(
        // colorList: [
        //   TColor.secondary,
        //   TColor.secondaryG,
        //   TColor.primary10,
        // ],
        gradientList: gradientList,
        dataMap: Map.fromIterable(pieChartData,
            key: (data) => data.label, value: (data) => data.value),
        animationDuration: Duration(milliseconds: 1000),
        chartRadius: MediaQuery.of(context).size.width / 2.8,
        chartType: ChartType.disc,
        ringStrokeWidth: 25,
        chartLegendSpacing: 40,

        legendOptions: LegendOptions(
            showLegendsInRow: false,
            legendPosition: LegendPosition.right,
            legendTextStyle: TextStyle(color: TColor.white)),
        chartValuesOptions: ChartValuesOptions(
          chartValueStyle: TextStyle(color: TColor.white),
          showChartValueBackground: false,
          showChartValues: true,
          showChartValuesInPercentage: true,
          showChartValuesOutside: false,
        ),
      ),
    );
  }
}
