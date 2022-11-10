import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:larix/screens/main/dashboard/widgets/custom_button_with_counter.dart';
import 'package:larix/screens/main/dashboard/widgets/custom_weekly_dashboard.dart';
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
            fit: BoxFit.fill,
            opacity: 0.6,
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
                    drawerColor: Colors.black26,
                    userNameColor: kPrimaryColor,
                    roleColor: Color.fromARGB(255, 108, 107, 107),
                  ),
                ),
              ),

              // Body of the Dashboard
              Expanded(
                flex: 9,
                child: ClipRRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                    child: Container(
                      padding:
                          const EdgeInsets.only(top: 32, right: 20, left: 20),
                      height: double.infinity,
                      width: double.infinity,
                      constraints: BoxConstraints(
                        maxHeight: MediaQuery.of(context).size.height,
                        maxWidth: MediaQuery.of(context).size.width,
                      ),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 212, 214, 229)
                            .withOpacity(0.4),
                        border: Border.all(
                          width: 0.5,
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
                          children: const [
                            // Weekly Stats
                            DashBoardTitle(
                              title: 'Weekly Stats',
                              color: kPrimaryColor,
                              size: 15,
                            ),

                            // Grid View
                            CustomWeeklyDashboard(),

                            //Tab Bar

                            CustomTabBar(),

                            //Check More
                            DashBoardTitle(
                              title: 'Check More',
                              color: kPrimaryColor,
                              size: 15,
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            CustomButtonWithCounter(
                              iconPath: Icons.access_time_rounded,
                              title: 'Clocking Time',
                            ),
                            CustomButtonWithCounter(
                              iconPath: Icons.person_add_alt_rounded,
                              title: 'Absent Today',
                            ),
                            CustomButtonWithCounter(
                              iconPath: Icons.person_add_alt_rounded,
                              title: 'New Employees',
                              nbNotification: 3,
                            ),
                            CustomButtonWithCounter(
                              iconPath: Icons.question_mark_rounded,
                              title: 'Pending Requests',
                              nbNotification: 10,
                            ),
                            SizedBox(
                              height: kBottomNavigationBarHeight + 10,
                            ),
                          ],
                        ),
                      ),
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
