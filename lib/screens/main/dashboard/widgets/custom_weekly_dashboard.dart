import 'package:flutter/material.dart';
import 'package:larix/screens/main/dashboard/widgets/card_weekly_stats.dart';

class CustomWeeklyDashboard extends StatelessWidget {
  const CustomWeeklyDashboard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:
            const EdgeInsets.only(top: 12, bottom: 8),
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
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
              ],
            ),
            const SizedBox(
              height: 6,
            ),
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
              children: const [
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
            )
          ],
        ));
  }
}