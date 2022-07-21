import 'package:flutter/material.dart';

class SignUpHeader extends StatelessWidget {
  const SignUpHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 24,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'larix',
            textScaleFactor: 2.5,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Poppins',
            ),
          ),
          Text(
            'THE COMPLETE SOLUTION FOR HUMAN RESOURCES MANAGEMENT',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Poppins',
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }
}