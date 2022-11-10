import 'package:flutter/material.dart';
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
        Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.5),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 6, right: 6),
            child: Align(
              alignment: Alignment.center,
              child: Container(
                height: kToolbarHeight,
                padding:
                    const EdgeInsets.only(left: 1, right: 1, top: 4, bottom: 4),
                child: TabBar(
                  controller: _tabController,
                  labelPadding: const EdgeInsets.only(left: 16, right: 16),
                  labelColor: kPrimaryColor,
                  labelStyle: const TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 12),
                  unselectedLabelColor: const Color(0xff5f6368),
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
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
          padding: const EdgeInsets.only(top: 8.0, bottom: 2),
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
                const CustomBarChart(),
                const CustomBarChart(tabContent: 1),
                CustomPieChart(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
