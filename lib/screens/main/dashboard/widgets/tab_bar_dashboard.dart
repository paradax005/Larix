import 'package:flutter/material.dart';
import 'package:larix/screens/main/dashboard/charts/attendance_chart.dart';
import 'package:larix/screens/main/dashboard/charts/bar_chart.dart';
import 'package:larix/screens/main/dashboard/charts/line_chart.dart';

import '../../../../utils/constant.dart';
import '../charts/pie_chart.dart';

class CustomTabBar extends StatefulWidget {
  const CustomTabBar({Key? key}) : super(key: key);

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    late TabController _tabController = TabController(
        length: 5, vsync: this, animationDuration: const Duration(seconds: 1));
    // late final AnimationController _animationController;

    return Column(
      children: [
        Card(
          child: Container(
            decoration: const BoxDecoration(
              color: kCardColor,
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 6, right: 6),
              child: Align(
                alignment: Alignment.center,
                child: TabBar(
                  controller: _tabController,
                  labelPadding: const EdgeInsets.only(left: 16, right: 16),
                  labelColor: kPrimaryColor,
                  labelStyle: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 14),
                  unselectedLabelColor: Colors.grey.shade600,
                  indicator: const BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.white,
                  ),
                  isScrollable: true,
                  tabs: const [
                    Tab(text: "Attendance"),
                    Tab(text: "Absence"),
                    Tab(text: "Staff Turnover"),
                    Tab(text: "Performance"),
                    Tab(text: "Working Format"),
                  ],
                ),
              ),
            ),
          ),
        ),

        // Tab Bar content
        Padding(
          padding: const EdgeInsets.only(top: 2.0),
          child: Container(
            width: double.maxFinite,
            color: Colors.transparent,
            height: 300,
            child: TabBarView(
              controller: _tabController,
              children: [
                const CustomLineChart(),
                const CustomLineChart(
                  index: 1,
                ),
                CustomBarChart(),
                CustomBarChart(tabContent: 1),
                // const Center(child: Text("Absence tabbar")),
                // const Center(child: Text("Staff Turnover tabbar")),
                // const Center(child: Text("Performance tabbar")),
                CustomPieChart(),
                // Center(child: Text("Working Format tabbar")),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
