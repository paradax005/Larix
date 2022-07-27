import 'package:flutter/material.dart';

class HeaderInputText extends StatelessWidget {
  const HeaderInputText({
    Key? key,
    required this.inputHeader,
  }) : super(key: key);

  final String inputHeader;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10,
        bottom: 5,
      ),
      child: Text(
        inputHeader,
        style: const TextStyle(
          color: Colors.white,
          fontFamily: "Poppins",
        ),
        textScaleFactor: 0.9,
      ),
    );
  }
}
