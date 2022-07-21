import 'package:flutter/material.dart';
import 'package:larix/screens/home/widgets/welcome_card.dart';
import 'package:larix/utils/size_config.dart';
import 'home_header.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: getProportionateScreenHeight(10),
            ),
            const HomeHeader(),
            const WelcomeCard(
                nbApp: 3, nbInter: 4, nbMeeting: 4, nbProjects: 9),
          ],
        ),
      ),
    );
  }
}
