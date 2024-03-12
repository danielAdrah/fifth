import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pie_chart/pie_chart.dart';

import '../model/pie_chart_model.dart';
import '../theme.dart';

class MyPieChart extends StatefulWidget {
  const MyPieChart({super.key});

  @override
  State<MyPieChart> createState() => _MyPieChartState();
}

class _MyPieChartState extends State<MyPieChart> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    // Static PieChartData
    List<PieChartData> pieChartData = [
      PieChartData("Food", 32),
      PieChartData("Drinks", 30),
      PieChartData("Entertainment", 45),
      PieChartData("Education", 35),
      PieChartData("Other", 60),
    ];
    return PieChart(
      dataMap: Map.fromIterable(pieChartData,
          key: (data) => data.label, value: (data) => data.value),
      animationDuration: Duration(milliseconds: 800),
      chartRadius: MediaQuery.of(context).size.width / 1.8,
      chartType: ChartType.ring,
      ringStrokeWidth: 45,
      chartLegendSpacing: 40,
      legendOptions: LegendOptions(
          showLegendsInRow: true,
          legendPosition: LegendPosition.bottom,
          legendTextStyle: TextStyle(color: TColor.white)),
      chartValuesOptions: ChartValuesOptions(
        chartValueStyle: TextStyle(color: TColor.white),
        showChartValueBackground: false,
        showChartValues: true,
        showChartValuesInPercentage: true,
        showChartValuesOutside: false,
      ),
    );
  }
}
