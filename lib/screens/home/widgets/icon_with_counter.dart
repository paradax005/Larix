import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utils/constant.dart';
import '../../../utils/size_config.dart';

class BtnWithCounter extends StatelessWidget {
  const BtnWithCounter({
    Key? key,
    required this.svgSrc,
    this.numOfItems = 0,
    required this.press,
  }) : super(key: key);

  final String svgSrc;
  final int numOfItems;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      borderRadius: BorderRadius.circular(45),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: EdgeInsets.all(getProportionateScreenWidth(8)),
            height: getProportionateScreenHeight(45),
            width: getProportionateScreenWidth(45),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: kSecondaryColor.withOpacity(0.1),
            ),
            child: SvgPicture.asset(svgSrc),
          ),
          if (numOfItems != 0)
            Positioned(
              right: 0,
              top: -3,
              child: Container(
                height: getProportionateScreenHeight(16),
                width: getProportionateScreenWidth(16),
                decoration: BoxDecoration(
                  color: const Color(0xffff4848),
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 1.5,
                    color: Colors.white,
                  ),
                ),
                child: Center(
                  child: Text(
                    "$numOfItems",
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(10),
                      height: 1,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}
