import 'package:flutter/material.dart';

class DividerBar extends StatelessWidget {
  const DividerBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(
              left: 10.0,
              right: 20.0,
            ),
            child: const Divider(
              color: Colors.white,
              height: 10,
            ),
          ),
        ),
        const Text(
          " OR ",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(
              left: 20.0,
              right: 10.0,
            ),
            child: const Divider(
              color: Colors.white,
              height: 10,
            ),
          ),
        ),
      ],
    );
  }
}
