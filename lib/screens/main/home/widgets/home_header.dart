import 'package:flutter/material.dart';
import 'package:larix/screens/home/widgets/icon_with_counter.dart';
import 'package:larix/screens/home/widgets/search_field.dart';

import '../../../../utils/size_config.dart';


class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SearchField(),
          BtnWithCounter(
            svgSrc: 'assets/icons/Bell.svg',
            numOfItems: 6,
            press: () {},
          ),
          BtnWithCounter(
            svgSrc: 'assets/icons/bxs-message.svg',
            numOfItems: 4,
            press: () {},
          ),
        ],
      ),
    );
  }
}
