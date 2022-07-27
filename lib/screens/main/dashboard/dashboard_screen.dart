import 'package:flutter/material.dart';

import 'package:larix/screens/main/dashboard/widgets/card_weekly_stats.dart';
import 'package:larix/screens/main/dashboard/widgets/custom_button_with_counter.dart';
import 'package:larix/screens/main/dashboard/widgets/dashboard_title_widget.dart';
import 'package:larix/screens/main/dashboard/widgets/header_dashboard.dart';
import 'package:larix/screens/main/dashboard/widgets/tab_bar_dashboard.dart';
import 'package:larix/utils/constant.dart';

import '../../../utils/size_config.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        constraints: BoxConstraints.expand(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
        ),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg_larix.png'),
            fit: BoxFit.cover,
            opacity: 0.8,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Header Dashboard
              const Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.only(right: 8.0, left: 8.0),
                  child: HeaderDashboard(
                    image: 'assets/images/profile_pic.png',
                    userConnected: true,
                    userName: 'ETCAdmin',
                    userRole: 'HR Manager',
                  ),
                ),
              ),

              // Body of the Dashboard
              Expanded(
                flex: 9,
                child: Container(
                  padding: const EdgeInsets.only(top: 32, right: 20, left: 20),
                  height: double.infinity,
                  width: double.infinity,
                  constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height,
                    maxWidth: MediaQuery.of(context).size.width,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.4),
                    border: Border.all(
                      width: 1,
                      color: Colors.white,
                    ),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Weekly Stats
                        const DashBoardTitle(
                          title: 'Weekly Stats',
                          color: kPrimaryColor,
                          size: 15,
                        ),

                        // Grid View
                        Padding(
                          padding: const EdgeInsets.only(top: 8, bottom: 8),
                          child: SizedBox(
                            height: 255,
                            child: GridView.extent(
                              primary: false,
                              maxCrossAxisExtent: 180,
                              childAspectRatio: 1.4,
                              mainAxisSpacing: 4,
                              crossAxisSpacing: 4,
                              children: const [
                                CardWeeklyStats(
                                  title: 'Absent Today',
                                  number: 28,
                                  percent: 30,
                                ),
                                CardWeeklyStats(
                                  title: 'Number of Leave',
                                  number: 17,
                                  percent: 17,
                                ),
                                CardWeeklyStats(
                                  title: 'Expiring Contracts',
                                  number: 2,
                                  percent: -10,
                                ),
                                CardWeeklyStats(
                                  title: 'Hapinesse Rate',
                                  number: 74,
                                  percent: 17,
                                ),
                              ],
                            ),
                          ),
                        ),

                        //Tab Bar
                        const CustomTabBar(),



                        //Check More
                        const DashBoardTitle(
                          title: 'Check More',
                          color: kPrimaryColor,
                          size: 15,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        const CustomButtonWithCounter(
                          iconPath: Icons.access_time_rounded,
                          title: 'Clocking Time',
                        ),
                        const CustomButtonWithCounter(
                          iconPath: Icons.person_add_alt_rounded,
                          title: 'Absent Today',
                        ),
                        const CustomButtonWithCounter(
                          iconPath: Icons.person_add_alt_rounded,
                          title: 'New Employees',
                          nbNotification: 3,
                        ),
                        const CustomButtonWithCounter(
                          iconPath: Icons.question_mark_rounded,
                          title: 'Pending Requests',
                          nbNotification: 10,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
