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
        border: Border.all(
          width: 1,
          color: Colors.white,
        ),
        color: Colors.white.withOpacity(0.5),
        // color: Colors.white.withOpacity(0.4),
        borderRadius: BorderRadius.circular(12),
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
                color: Colors.black87,
                size: 14,
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                height: 0.8,
                color: const Color.fromARGB(255, 79, 79, 79),
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
                    style: const TextStyle(
                      color: Colors.black,
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
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          : Text(
                              '$percent%',
                              textScaleFactor: 0.9,
                              style: const TextStyle(
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
