import 'dart:math';

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

import 'dummydata/bar_chart_data.dart';

class CustomBarChart extends StatelessWidget {
  CustomBarChart({Key? key, this.tabContent = 0}) : super(key: key);

  // 0 or 1
  final int tabContent;

  // final List<BarChartModel> data = [
  //   BarChartModel(
  //     month: "Jan",
  //     percent: 82,
  //   ),
  //   BarChartModel(
  //     month: "Feb",
  //     percent: 62,
  //   ),
  //   BarChartModel(
  //     month: "Mar",
  //     percent: 92,
  //   ),
  //   BarChartModel(
  //     month: "Apr",
  //     percent: 42,
  //   ),
  //   BarChartModel(
  //     month: "May",
  //     percent: 48,
  //   ),
  //   BarChartModel(
  //     month: "Jun",
  //     percent: 75,
  //   ),
  //   BarChartModel(
  //     month: "Jul",
  //     percent: 65,
  //   ),
  //   BarChartModel(
  //     month: "Aug",
  //     percent: 33,
  //   ),
  //   BarChartModel(
  //     month: "Sep",
  //     percent: 22,
  //   ),
  // ];

  @override
  Widget build(BuildContext context) {
    List<charts.Series<BarChartModel, String>> series = [
      charts.Series(
        id: "percent",
        data: tabContent == 0 ? dataStaff : dataPerf,
        domainFn: (BarChartModel series, _) => series.month,
        measureFn: (BarChartModel series, _) => series.percent,
        colorFn: (BarChartModel series, _) =>
            charts.ColorUtil.fromDartColor(Color.fromARGB(183, 101, 75, 227)),
      ),
    ];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 12),
      child: charts.BarChart(
        series,
        animate: true,
        animationDuration: const Duration(seconds: 2),
        defaultRenderer: charts.BarRendererConfig(
          strokeWidthPx: 1,
          maxBarWidthPx: 6,
        ),
       barRendererDecorator: charts.BarLabelDecorator<String>(),

       
      ),
    );
  }
}

class BarChartModel {
  String month;
  double percent;

  BarChartModel({
    required this.month,
    required this.percent,
  });
}
