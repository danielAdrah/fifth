// ignore_for_file: prefer_for_elements_to_map_fromiterable, prefer_const_constructors, invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:get/get.dart';
import 'package:pie_chart/pie_chart.dart';
import '../../../controller/expense_controller.dart';
import '../../../model/pie_chart_model.dart';
import '../../../theme.dart';
import 'dart:math';

class SubPieChart extends StatefulWidget {
  SubPieChart({super.key, required this.category});

  final String category;

  @override
  State<SubPieChart> createState() => _SubPieChartState();
}

class _SubPieChartState extends State<SubPieChart> {
  final controller = Get.put(ExpenseController());

  @override
  Widget build(BuildContext context) {
    controller.category.value = widget.category;
    final gradientList = <List<Color>>[
      [
        Color.fromARGB(255, 153, 188, 241),
        Color(0xFF64b3f4),
        Color(0xFF4286f4),
      ],
      [
        Color(0xFFb3e5fc),
        Color(0xFF4dd0e1),
        Color.fromARGB(255, 62, 153, 165),
      ],
      [
        Color(0xFFb9f6ca),
        Color(0xFF69f0ae),
        Color(0xFF00e676),
      ]
    ];
    List<PieChartData> emptyPieChartData = [
      PieChartData("", 0),
      PieChartData("", 0),
      PieChartData("", 0),
      // PieChartData("Education", 35),
      // PieChartData("Other", 60),
    ];

    return Padding(
        padding: const EdgeInsets.only(left: 15),
        child: Obx(
          () => PieChart(
            gradientList: gradientList,
            dataMap: controller.transportSubPieInfo.value.isEmpty
                ? Map.fromIterable(emptyPieChartData,
                    key: (data) => data.label, value: (data) => data.value)
                : Map.fromIterable(controller.transportSubPieInfo.value,
                    key: (element) => element.subcategory,
                    value: (element) => element.sum),
            // Map.fromIterable(pieChartData,
            //     key: (data) => data.label, value: (data) => data.value),
            animationDuration: Duration(milliseconds: 1000),
            chartRadius: MediaQuery.of(context).size.width / 2.8,
            chartType: ChartType.disc,
            ringStrokeWidth: 25,
            chartLegendSpacing: 40,

            legendOptions: LegendOptions(
                showLegends:
                    controller.transportSubPieInfo.value.isEmpty ? false : true,
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

//====================================

class FoodSubPieChart extends StatefulWidget {
  FoodSubPieChart({super.key});

  @override
  State<FoodSubPieChart> createState() => _FoodSubPieChartState();
}

class _FoodSubPieChartState extends State<FoodSubPieChart> {
  final controller1 = Get.put(ExpenseController());

  @override
  Widget build(BuildContext context) {
    final gradientList = <List<Color>>[
      [
        Color(0xFFa7ffeb9),
        Color(0xFF17a2b8a),
        Color(0xFF0d9488),
      ],
      [
        Color(0xFFfdba74),
        Color(0xFFfb923c),
        Color(0xFFef4444),
      ],
      [
        Color(0xFFdbe4ff),
        Color(0xFF93c5fd),
        Color(0xFF60a5fa),
      ]
    ];
    List<PieChartData> emptyPieChartData = [
      PieChartData("", 0),
      PieChartData("", 0),
      PieChartData("", 0),
      // PieChartData("Education", 35),
      // PieChartData("Other", 60),
    ];

    return Padding(
        padding: const EdgeInsets.only(left: 15),
        child: Obx(
          () => PieChart(
            gradientList: gradientList,
            dataMap: controller1.foodSubPieInfo.value.isEmpty
                ? Map.fromIterable(emptyPieChartData,
                    key: (data) => data.label, value: (data) => data.value)
                : Map.fromIterable(controller1.foodSubPieInfo.value,
                    key: (element) => element.subcategory,
                    value: (element) => element.sum),
            // Map.fromIterable(pieChartData,
            //     key: (data) => data.label, value: (data) => data.value),
            animationDuration: Duration(milliseconds: 1000),
            chartRadius: MediaQuery.of(context).size.width / 2.8,
            chartType: ChartType.disc,
            ringStrokeWidth: 25,
            chartLegendSpacing: 40,

            legendOptions: LegendOptions(
                showLegends:
                    controller1.foodSubPieInfo.value.isEmpty ? false : true,
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

//==========================

class HomeSubPieChart extends StatefulWidget {
  HomeSubPieChart({super.key});

  @override
  State<HomeSubPieChart> createState() => _HomeSubPieChartState();
}

class _HomeSubPieChartState extends State<HomeSubPieChart> {
  final controller2 = Get.put(ExpenseController());

  @override
  Widget build(BuildContext context) {
    final gradientList = <List<Color>>[
      [
        Color(0xFF93c5fd),
        Color(0xFF60a5fa),
        Color(0xFF3b82f6),
      ],
      [
        Color(0xFF10b981),
        Color(0xFF059669),
        Color.fromARGB(255, 3, 88, 61),
      ],
      [
        Color.fromARGB(255, 84, 82, 224),
        Color.fromARGB(255, 24, 140, 194),
      ]
    ];
    List<PieChartData> emptyPieChartData = [
      PieChartData("", 0),
      PieChartData("", 0),
      PieChartData("", 0),
      // PieChartData("Education", 35),
      // PieChartData("Other", 60),
    ];

    return Padding(
        padding: const EdgeInsets.only(left: 15),
        child: Obx(
          () => PieChart(
            gradientList: gradientList,
            dataMap: controller2.homeSubPieInfo.value.isEmpty
                ? Map.fromIterable(emptyPieChartData,
                    key: (data) => data.label, value: (data) => data.value)
                : Map.fromIterable(controller2.homeSubPieInfo.value,
                    key: (element) => element.subcategory,
                    value: (element) => element.sum),
            // Map.fromIterable(pieChartData,
            //     key: (data) => data.label, value: (data) => data.value),
            animationDuration: Duration(milliseconds: 1000),
            chartRadius: MediaQuery.of(context).size.width / 2.8,
            chartType: ChartType.disc,
            ringStrokeWidth: 25,
            chartLegendSpacing: 40,

            legendOptions: LegendOptions(
                showLegends:
                    controller2.homeSubPieInfo.value.isEmpty ? false : true,
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
