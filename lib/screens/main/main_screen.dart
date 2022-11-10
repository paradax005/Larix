import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:larix/screens/main/Hr_Indicator/hr_indicator_screen.dart';
import 'package:larix/screens/main/calendar/calendar_screen.dart';
import 'package:larix/screens/main/dashboard/dashboard_screen.dart';
import 'package:larix/screens/main/profile/profile_screen.dart';
import 'package:larix/utils/constant.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _mIndex = 0;
  final List<Widget> _interfaces = const [
    DashboardScreen(),
    CalendarScreen(),
    HRIndicatorScreen(),
    ProfileScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: _interfaces[_mIndex],
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 12,
          selectedItemColor: kPrimaryColor,
          unselectedItemColor: kSecondaryColor,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          selectedIconTheme: const IconThemeData(
            color: kPrimaryColor,
          ),
          selectedLabelStyle: const TextStyle(
            color: kPrimaryColor,
            fontWeight: FontWeight.w600,
          ),
          elevation: 8,
          currentIndex: _mIndex,
          onTap: (value) {
            //0 - 1 - 2 - 3
            setState(() {
              _mIndex = value;
            });
          },
          items: [
            //1
            const BottomNavigationBarItem(
                icon: Icon(IconlyBold.home),
                // icon: _mIndex != 0
                //     ? const Icon(IconlyBold.home)
                //     : SvgPicture.asset(
                //         'assets/icons/dashboard.svg',
                //         width: 25,
                //       ),
                label: 'Dashboard'),
            //2
            BottomNavigationBarItem(
                // icon: Icon(IconlyBold.calendar),

                // icon: _mIndex != 1
                //     ? SvgPicture.asset(
                //         'assets/icons/calendar_fill.svg',
                //         width: 25,
                //       )
                //     : SvgPicture.asset(
                //         'assets/icons/calendar.svg',
                //         width: 25,
                //       ),

                icon: _mIndex != 1
                    ? Image.asset(
                        'assets/images/calendar_disable.png',
                        width: 36,
                      )
                    : Image.asset(
                        'assets/images/calendar_active.png',
                        width: 36,
                      ),
                label: 'Calendar'),
            //3
            const BottomNavigationBarItem(
                icon: Icon(IconlyBold.chart), label: 'HrIndicator'),
            //4
            const BottomNavigationBarItem(
              // icon: Icon(
              //   IconlyBold.profile,
              //   color: _mIndex != 3 ? Colors.grey.shade600 : kPrimaryColor,
              // ),
              icon: Icon(IconlyBold.profile),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
