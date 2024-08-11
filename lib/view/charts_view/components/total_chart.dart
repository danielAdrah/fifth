// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class IncreasingLineChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LineChart(LineChartData(
        gridData: FlGridData(show: false),
        titlesData: FlTitlesData(show: false),
        borderData: FlBorderData(show: false),
        lineTouchData: LineTouchData(
          touchTooltipData: LineTouchTooltipData(
            tooltipBgColor: Colors.blueAccent,

            // tooltipRodsData: [
            //   LineChartBarData(
            //     belowBarData: BarAreaData(show: false),
            //     aboveBarData: BarAreaData(show: false),
            //   ),
            // ],
          ),
        ),
        lineBarsData: [
          LineChartBarData(
            spots: [
              FlSpot(0, 1),
              FlSpot(1, 2),
              FlSpot(2, 3),
              FlSpot(3, 5),
              FlSpot(4, 7),
              FlSpot(5, 9),
              FlSpot(6, 12),
              FlSpot(7, 15),
              FlSpot(8, 20),
              FlSpot(9, 25),
              FlSpot(10, 30),
            ],
            isCurved: true,
            color: Colors.blue,
            dotData: FlDotData(show: false),
            barWidth: 3,
            belowBarData: BarAreaData(
              show: true,
              color: Colors.blue.withOpacity(0.3),
            ),
          ),
        ]));
  }
}
