import 'package:flutter/material.dart';

class DashBoardTitle extends StatelessWidget {
  const DashBoardTitle({
    Key? key,
    required this.title,
    required this.color,
    required this.size,
  }) : super(key: key);

  final String title;
  final Color color;
  final double size;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      child: Text(
        title,
        style: TextStyle(
          fontFamily: 'Poppins-Medium',
          fontWeight: FontWeight.w500,
          fontSize: size,
          color: color,
        ),
      ),
    );
  }
}
