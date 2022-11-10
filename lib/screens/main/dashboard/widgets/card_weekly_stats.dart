import 'package:flutter/material.dart';
import 'package:larix/screens/main/dashboard/widgets/dashboard_title_widget.dart';

class CardWeeklyStats extends StatelessWidget {
  const CardWeeklyStats({
    Key? key,
    required this.title,
    required this.number,
    required this.percent,
  }) : super(key: key);

  final String title;
  final int number;
  final double percent;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // border: Border.all(
        //   width: 2,
        //   color: Colors.white,
        // ),
        gradient: const LinearGradient(
          colors: [
            // Color.fromARGB(255, 15, 97, 230),
            // Color.fromARGB(255, 61, 150, 228),
            // Color.fromARGB(255, 81, 127, 196)
            Color.fromARGB(255, 73, 122, 237),
            Color.fromARGB(255, 87, 78, 234),
            Color.fromARGB(255, 87, 131, 234),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        // color: Colors.white.withOpacity(0.4),
        borderRadius: BorderRadius.circular(16),
      ),
      height: (MediaQuery.of(context).size.width / 2 - 24) * 0.7,
      width: MediaQuery.of(context).size.width / 2 - 24,
      child: Padding(
        padding: const EdgeInsets.only(
          top: 8,
          right: 20,
          left: 20,
          bottom: 8,
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DashBoardTitle(
                title: title,
                color: Colors.white.withOpacity(0.9),
                size: 14,
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                height: 0.8,
                color: const Color.fromARGB(255, 227, 225, 225),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '$number',
                    textScaleFactor: 2,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.9),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Row(
                    children: [
                      percent > 0
                          ? Image.asset('assets/images/up.png')
                          : Image.asset('assets/images/down.png'),
                      percent > 0
                          ? Text(
                              '+ $percent%',
                              textScaleFactor: 0.9,
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.9),
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          : Text(
                              '$percent%',
                              textScaleFactor: 0.9,
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.9),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                    ],
                  )
                ],
              )
            ]),
      ),
    );
  }
}
