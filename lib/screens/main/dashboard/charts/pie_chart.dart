import 'package:flutter/material.dart';
import 'package:larix/utils/constant.dart';
import 'package:pie_chart/pie_chart.dart';

class CustomPieChart extends StatelessWidget {
  CustomPieChart({Key? key}) : super(key: key);

  final dataMap = <String, double>{
    "On Site": 70,
    "On Remote": 30,
  };

  final colorList = <Color>[
    kPrimaryColor,
    Colors.white,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: PieChart(
        // data and colors of each item in pie chart
        dataMap: dataMap,
        colorList: colorList,
        // centre text
        centerText: 'Total\n\n 170',
        centerTextStyle: const TextStyle(
          fontSize: 20,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),

        //chart option
        chartType: ChartType.ring,
        chartLegendSpacing: 20,
        chartRadius: MediaQuery.of(context).size.width / 2,
        ringStrokeWidth: 12,
        baseChartColor: Colors.grey[50]!.withOpacity(0.4),
        chartValuesOptions: const ChartValuesOptions(
          showChartValueBackground: false,
          showChartValues: false,
        ),
        // Animation
        animationDuration: const Duration(seconds: 2),

        // Legend Option
        legendOptions: const LegendOptions(
          legendTextStyle: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w600,
          ),
          showLegendsInRow: true,
          legendPosition: LegendPosition.bottom,
        ),

        totalValue: 100,
      ),
    );
  }
}
