// ignore_for_file: prefer_for_elements_to_map_fromiterable, prefer_const_constructors

import 'package:flutter/material.dart';
// import 'package:get/get.dart';
import 'package:pie_chart/pie_chart.dart';
import '../controller/expense_controller.dart';
import '../model/pie_chart_model.dart';
import '../theme.dart';
import 'package:get/get.dart';

class MyPieChart extends StatefulWidget {
  const MyPieChart({super.key});

  @override
  State<MyPieChart> createState() => _MyPieChartState();
}

class _MyPieChartState extends State<MyPieChart> {
  final controller = Get.put(ExpenseController());
  @override
  Widget build(BuildContext context) {
    // var media = MediaQuery.of(context).size;

    // Static PieChartData
    List<PieChartData> pieChartData = [
      PieChartData("Food", 32),
      PieChartData("Home & Applainces", 30),
      PieChartData("Transport", 45),
      // PieChartData("Education", 35),
      // PieChartData("Other", 60),
    ];
    List<PieChartData> emptyPieChartData = [
      PieChartData("", 0),
      PieChartData("", 0),
      PieChartData("", 0),
      // PieChartData("Education", 35),
      // PieChartData("Other", 60),
    ];
    final gradientList = <List<Color>>[
      [
        Color(0xFF00b4db),
        Color(0xFF0083b0),
      ],
      [
        Color(0xFFb24592),
        Color(0xFFf15f79),
      ],
      [
        Color(0xFFa8ff78),
        Color(0xFF78ffd6),
      ]
    ];
    return Padding(
        padding: const EdgeInsets.only(left: 15),
        child: Obx(
          () => PieChart(
            dataMap: controller.pieInfo.isEmpty
                ? Map.fromIterable(emptyPieChartData,
                    key: (data) => data.label, value: (data) => data.value)
                : Map.fromIterable(controller.pieInfo.value,
                    key: (element) => element.category,
                    value: (element) => element.sum),

            // Map.fromIterable(pieChartData,
            //     key: (data) => data.label, value: (data) => data.value),
            animationDuration: Duration(milliseconds: 800),
            chartRadius: MediaQuery.of(context).size.width / 2.5,
            chartType: ChartType.ring,
            ringStrokeWidth: 30,
            gradientList: gradientList,
            chartLegendSpacing: 40,
            centerText:
                controller.pieInfo.isEmpty ? "Selecet an account\n first" : "",
            centerTextStyle: TextStyle(
                color:
                    controller.pieInfo.isEmpty ? TColor.gray50 : TColor.gray),
            legendOptions: LegendOptions(
                showLegends: controller.pieInfo.isEmpty ? false : true,
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
        ));
  }
}
