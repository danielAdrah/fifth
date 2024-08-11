// ignore_for_file: prefer_for_elements_to_map_fromiterable, prefer_const_constructors

import 'package:flutter/material.dart';
// import 'package:get/get.dart';
import 'package:pie_chart/pie_chart.dart';
import '../model/pie_chart_model.dart';
import '../theme.dart';
// import 'package:http/http.dart';

class MyPieChart extends StatefulWidget {
  const MyPieChart({super.key});

  @override
  State<MyPieChart> createState() => _MyPieChartState();
}

class _MyPieChartState extends State<MyPieChart> {
  @override
  Widget build(BuildContext context) {
    // var media = MediaQuery.of(context).size;

    // Static PieChartData
    List<PieChartData> pieChartData = [
      PieChartData("Food", 32),
      PieChartData("Home & Applainces", 30),
      PieChartData("Transport", 45),
      PieChartData("Education", 35),
      PieChartData("Other", 60),
    ];
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: PieChart(
        dataMap: Map.fromIterable(pieChartData,
            key: (data) => data.label, value: (data) => data.value),
        animationDuration: Duration(milliseconds: 800),
        chartRadius: MediaQuery.of(context).size.width / 2,
        chartType: ChartType.ring,
        ringStrokeWidth: 35,
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
