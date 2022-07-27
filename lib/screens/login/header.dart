import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 36,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Text(
            'Larix',
            textScaleFactor: 4,
            style: TextStyle(
              color: Color(0xFF5138EE),
              fontFamily: 'Syntha',
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            'THE COMPLETE SOLUTION FOR HUMAN RESOURCES MANAGEMENT',
            style: TextStyle(
              color: Color(0xFF5138EE),
              fontFamily: 'Poppins',
              fontSize: 8,
            ),
            // textScaleFactor: 0.3,
          ),
        ],
      ),
    );
  }
}