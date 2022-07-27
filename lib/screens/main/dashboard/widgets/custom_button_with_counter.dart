import 'package:flutter/material.dart';

import '../../../../utils/constant.dart';
import '../../../../utils/size_config.dart';

class CustomButtonWithCounter extends StatefulWidget {
  const CustomButtonWithCounter({
    Key? key,
    required this.iconPath,
    required this.title,
    this.nbNotification = 0,
  }) : super(key: key);

  final IconData iconPath;
  final String title;
  final int nbNotification;

  @override
  State<CustomButtonWithCounter> createState() =>
      _CustomButtonWithCounterState();
}

class _CustomButtonWithCounterState extends State<CustomButtonWithCounter> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.only(
        right: 16,
        left: 16,
      ),
      width: MediaQuery.of(context).size.width,
      height: 55,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.5),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Icon(
                widget.iconPath,
                color: widget.nbNotification > 0 ? kPrimaryColor : Colors.grey,
              ),
              const SizedBox(
                width: 24,
              ),
              Text(
                widget.title,
                style: TextStyle(
                  color: widget.nbNotification == 0
                      ? Colors.grey.shade600
                      : kPrimaryColor.withOpacity(0.7),
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
            ],
          ),
          Row(
            children: [
              if (widget.nbNotification > 0)
                Container(
                  height: getProportionateScreenWidth(22),
                  width: getProportionateScreenWidth(22),
                  decoration: const BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      widget.nbNotification.toString(),
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(12),
                        height: 1.3,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
            ],
          )
        ],
      ),
    );
  }
}
