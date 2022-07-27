import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:larix/utils/constant.dart';

class CustomLineChart extends StatelessWidget {
  const CustomLineChart({
    Key? key,
    this.index = 0,
  }) : super(key: key);

  final int index;

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff68737d),
      fontSize: 8,
    );
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = const Text('JAN', style: style);
        break;
      case 1:
        text = const Text('FEB', style: style);
        break;
      case 2:
        text = const Text('MAR', style: style);
        break;

      case 3:
        text = const Text('APR', style: style);
        break;

      case 4:
        text = const Text('MAI', style: style);
        break;
      case 5:
        text = const Text('JUN', style: style);
        break;
      case 6:
        text = const Text('JUL', style: style);
        break;
      case 7:
        text = const Text('AOUT', style: style);
        break;
      case 8:
        text = const Text('SEP', style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 8.0,
      child: text,
    );
  }

  Widget LeftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff68737d),
      fontSize: 8,
    );
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = const Text('0', style: style);
        break;

      case 2:
        text = const Text('20', style: style);
        break;

      case 4:
        text = const Text('40', style: style);
        break;
      case 6:
        text = const Text('60', style: style);
        break;
      case 8:
        text = const Text('80', style: style);
        break;
      case 10:
        text = const Text('100', style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 8.0,
      child: text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: const BorderRadius.all(
          Radius.circular(18),
        ),
      ),
      child: LineChart(
        LineChartData(
            minX: 0,
            maxX: 9,
            minY: 0,
            maxY: 11,
            titlesData: FlTitlesData(
              //disable right and side titles ! !
              rightTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              topTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),

              // Set custom bottom titles ! !
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 24,
                  interval: 1,
                  getTitlesWidget: bottomTitleWidgets,
                ),
              ),

              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 24,
                  interval: 1,
                  getTitlesWidget: LeftTitleWidgets,
                ),
              ),
            ),
            gridData: FlGridData(
              show: true,
              drawVerticalLine: false,
            ),
            lineBarsData: [
              LineChartBarData(
                  barWidth: 2.2,
                  spots: index == 0
                      ? const [
                          FlSpot(0, 4),
                          FlSpot(1, 3.2),
                          FlSpot(2, 4.5),
                          FlSpot(3, 3.8),
                          FlSpot(4, 6.4),
                          FlSpot(5, 9.6),
                          FlSpot(6, 6.2),
                          FlSpot(7, 7.0),
                          FlSpot(8, 3.8),
                        ]
                      : const [
                          FlSpot(0, 4),
                          FlSpot(1, 3.2),
                          FlSpot(2, 3.5),
                          FlSpot(3, 5.8),
                          FlSpot(4, 3.4),
                          FlSpot(5, 8.6),
                          FlSpot(6, 5.2),
                          FlSpot(7, 8.0),
                          FlSpot(8, 4.8),
                        ],
                  isCurved: true,
                  color: index == 0 ? kPrimaryColor : Colors.redAccent,
                  dotData: FlDotData(
                    show: false,
                  )),
            ]),
      ),
    );
  }
}
